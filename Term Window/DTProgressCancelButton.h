//  Copyright (c) 2007-2010 Decimus Software, Inc. All rights reserved.


@interface DTProgressCancelButton : NSButton {
	NSTrackingArea* trackingArea;
	BOOL mouseInside;
	
	NSTimer* animationTimer;
	NSArray*animationImages;
	unsigned char nextAnimImg;
}

@end
