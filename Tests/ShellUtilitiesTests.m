//  Copyright (c) 2007-2010 Decimus Software, Inc. All rights reserved.

#import "ShellUtilitiesTests.h"

#import "DTShellUtilities.h"

@implementation ShellUtilitiesTests

- (void)testPathEscaping {
	NSString* original;
	NSString* escaped;
	NSString* unescaped;
	
	original = @"/Users/bdr/Documents/Documents/Decimus/trunk/Playground/DTerm/Tests/";
	escaped = escapedPath(original);
	unescaped = unescapedPath(escaped);
	XCTAssertEqualObjects(original, escaped, @"escaping changed a string that didn't need to be changed");
	XCTAssertEqualObjects(escaped, unescaped, @"unescaping changed a string that didn't need to be changed");
	
	original = @"DTerm/Full Key Codes";
	escaped = escapedPath(original);
	unescaped = unescapedPath(escaped);
	XCTAssertEqualObjects(escaped, @"DTerm/Full\\ Key\\ Codes",
						 @"escaping didn't escape spaces");
	XCTAssertEqualObjects(unescaped, original,
						 @"unescaping didn't restore original");
	XCTAssertNil(unescapedPath(original), @"unescapedPath returned something when given a string with unescaped special chars");
}

- (void)testShellWordParsing {
	NSString* command = @"foobar separate things 'single quoted' \"double quoted\" escaped\\ thing";
	NSRange returnedRange;
	
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 3)],
						 @"foo",
						 @"Failed to correctly identify word at beginning of string");
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 6)],
						 @"foobar",
						 @"Failed to correctly identify word just before space");
	
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 7)],
						 @"",
						 @"Failed to correctly identify empty word just after space");
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 10)],
						 @"sep",
						 @"Failed to correctly identify word after space");
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 15)],
						 @"separate",
						 @"Failed to correctly identify word between spaces");
	
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 16)],
						 @"",
						 @"Failed to correctly identify empty word just after second space");
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 20)],
						 @"thin",
						 @"Failed to correctly identify word after second space");
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 22)],
						 @"things",
						 @"Failed to correctly identify full word after second space");
	
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 23)],
						 @"",
						 @"Failed to correctly identify empty word before single quote");
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 24)],
						 @"",
						 @"Failed to correctly identify empty word after opening single quote");
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 27)],
						 @"sin",
						 @"Failed to correctly identify partial word after opening single quote");
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 30)],
						 @"single",
						 @"Failed to correctly identify full word after opening single quote");
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 31)],
						 @"single ",
						 @"Failed to correctly identify full word plus space after opening single quote");
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 34)],
						 @"single quo",
						 @"Failed to correctly identify full word+space+partial word after opening single quote");
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 37)],
						 @"single quoted",
						 @"Failed to correctly identify full single quoted phrase before close quote");
	returnedRange = lastShellWordBeforeIndex(command, 38);
	XCTAssertTrue(returnedRange.location == NSNotFound, @"Should be NSNotFound directly after single quoted strings");
	
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 39)],
						 @"",
						 @"Failed to correctly identify empty word before double quote");
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 40)],
						 @"",
						 @"Failed to correctly identify empty word after opening double quote");
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 43)],
						 @"dou",
						 @"Failed to correctly identify partial word after opening double quote");
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 46)],
						 @"double",
						 @"Failed to correctly identify full word after opening double quote");
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 47)],
						 @"double ",
						 @"Failed to correctly identify full word plus space after opening double quote");
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 50)],
						 @"double quo",
						 @"Failed to correctly identify full word+space+partial word after opening double quote");
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 53)],
						 @"double quoted",
						 @"Failed to correctly identify full double quoted phrase before close quote");
	returnedRange = lastShellWordBeforeIndex(command, 54);
	XCTAssertTrue(returnedRange.location == NSNotFound, @"Should be NSNotFound directly after double quoted strings");
	
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 55)],
						 @"",
						 @"Failed to correctly identify empty word after space after double quote");
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 62)],
						 @"escaped",
						 @"Failed to correctly identify word just before escaped space");
	returnedRange = lastShellWordBeforeIndex(command, 63);
	XCTAssertTrue(returnedRange.location == NSNotFound, @"Should be NSNotFound when in incomplete escape sequence");
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 64)],
						 @"escaped\\ ",
						 @"Failed to correctly identify word just after escaped space");
	XCTAssertEqualObjects([command substringWithRange:lastShellWordBeforeIndex(command, 69)],
						 @"escaped\\ thing",
						 @"Failed to correctly identify phrase containing escaped space");
	
	// TODO: need to do tests on a string with escaped quotes inside quotes and whatnot
	// ...but I'm sick of this for now.
}

@end
