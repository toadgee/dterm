//  Copyright (c) 2007-2010 Decimus Software, Inc. All rights reserved.


@interface RTFWindowController : NSWindowController

@property NSString* rtfPath;
@property NSString* windowTitle;

- (instancetype)initWithRTFFile:(NSString*)_rtfPath;

@end
