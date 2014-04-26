//  Copyright (c) 2007-2010 Decimus Software, Inc. All rights reserved.

@class DTCommandFieldEditor;
@class DTResultsView;
@class DTResultsTextView;

@interface DTTermWindowController : NSWindowController {
	NSString* __weak workingDirectory;
	NSArray* __weak selectedURLs;
	
	NSString* __weak command;
	IBOutlet NSPopUpButton* actionButton;
	IBOutlet NSMenu* actionMenu;
	
	NSMutableArray* __weak runs;
	IBOutlet NSArrayController* __weak runsController;
	IBOutlet NSView* placeholderForResultsView;
	IBOutlet DTResultsView* resultsView;
	IBOutlet DTResultsTextView* resultsTextView;
	
	IBOutlet NSTextField* commandField;
	DTCommandFieldEditor* commandFieldEditor;
}

@property (weak) NSString* workingDirectory;
@property (weak) NSArray* selectedURLs;
@property (weak) NSString* command;
@property (weak) NSMutableArray* runs;
@property (weak) NSArrayController* runsController;

- (void)activateWithWorkingDirectory:(NSString*)wdPath
						   selection:(NSArray*)selection
						 windowFrame:(NSRect)frame;
- (void)deactivate;

- (void)requestWindowHeightChange:(CGFloat)dHeight;

- (IBAction)insertSelection:(id)sender;
- (IBAction)insertSelectionFullPaths:(id)sender;
- (IBAction)pullCommandFromResults:(id)sender;
- (IBAction)executeCommand:(id)sender;
- (IBAction)executeCommandInTerminal:(id)sender;
- (IBAction)copyResultsToClipboard:(id)sender;
- (IBAction)cancelCurrentCommand:(id)sender;

- (NSArray*)completionsForPartialWord:(NSString*)partialWord
							isCommand:(BOOL)isCommand
				  indexOfSelectedItem:(NSInteger*)index;

@end
