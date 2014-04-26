//  Copyright (c) 2007-2010 Decimus Software, Inc. All rights reserved.


@interface RTFWindowController : NSWindowController {
	NSString* __weak rtfPath;
	NSString* __weak windowTitle;
}

@property (weak) NSString* rtfPath;
@property (weak) NSString* windowTitle;

- (id)initWithRTFFile:(NSString*)_rtfPath;

@end
