//  DTAppController.h
//  Copyright (c) 2007-2010 Decimus Software, Inc. All rights reserved.

#import "SRCommon.h"

@class DTPrefsWindowController;
@class DTTermWindowController;
@class RTFWindowController;

@class SUUpdater;

extern NSString* DTResultsToKeepKey;
extern NSString* DTTextColorKey;
extern NSString* DTFontNameKey;
extern NSString* DTFontSizeKey;

@interface DTAppController : NSObject {
	IBOutlet SUUpdater* sparkleUpdater;
	DTPrefsWindowController* prefsWindowController;
	DTTermWindowController* termWindowController;
	
	RTFWindowController* acknowledgmentsWindowController;
	RTFWindowController* licenseWindowController;
	
	EventHotKeyRef hotKeyRef;
	KeyCombo hotKey;
	
	NSUInteger numCommandsExecuted;
}

@property (assign) SUUpdater* sparkleUpdater;
@property NSUInteger numCommandsExecuted;
@property (readonly) DTPrefsWindowController* prefsWindowController;
@property (readonly) DTTermWindowController* termWindowController;

- (IBAction)showPrefs:(id)sender;
- (IBAction)showAcknowledgments:(id)sender;
- (IBAction)showLicense:(id)sender;

- (KeyCombo)hotKey;
- (void)setHotKey:(KeyCombo)newHotKey;
- (void)hotkeyPressed;

- (void)saveHotKeyToUserDefaults;
- (void)loadHotKeyFromUserDefaults;

- (void)loadStats;
- (void)saveStats;

@end
