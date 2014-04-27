//  Copyright (c) 2007-2011 Decimus Software, Inc. All rights reserved.


@interface DTPrefsAXController : NSViewController

@property (readonly) BOOL axAppTrusted;
@property (readonly) NSString* axTrustStatusString;
@property (readonly) BOOL axGeneralAccessEnabled;
@property (readonly) NSString* axGeneralAccessEnabledString;

- (void)recheckGeneralAXAccess;

- (IBAction)setAXTrusted:(id)sender;

@end
