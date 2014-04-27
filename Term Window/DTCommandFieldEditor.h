//  Copyright (c) 2007-2010 Decimus Software, Inc. All rights reserved.

@class DTTermWindowController;

@interface DTCommandFieldEditor : NSTextView {
	DTTermWindowController* controller;
}

@property (nonatomic, readonly) BOOL isFirstResponder;

- (id)initWithController:(DTTermWindowController*)_controller;
- (void)insertFiles:(NSArray*)selectedPaths;

@end
