//  Copyright (c) 2007-2010 Decimus Software, Inc. All rights reserved.

#import "DSNumberFormatterTransformer.h"

@interface DSNumberFormatterTransformer ()

@property NSNumberFormatter *numberFormatter;

@end

@implementation DSNumberFormatterTransformer

- (id)initWithNumberFormatter:(NSNumberFormatter*)inFormatter {
	if((self = [super init])) {
		self.numberFormatter = inFormatter;
	}
	
	return self;
}

+ (Class)transformedValueClass {
	return [NSString class];
}

+ (BOOL)allowsReverseTransformation {
	return NO;
}

- (id)transformedValue:(id)value {
	if(!value)
		return nil;
	
	return [self.numberFormatter stringFromNumber:value];
}

@end
