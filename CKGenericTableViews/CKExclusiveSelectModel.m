//
//  FFExclusiveSelectModel.m
//  FiftyFinder
//
//  Created by Casey Kolderup on 12/6/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CKExclusiveSelectModel.h"


@implementation CKExclusiveSelectModel

@synthesize choices;
@synthesize currentSelectionIndex;

- (id)initWithChoices:(NSArray *)newChoices {
	self = [super init];
	if (self != nil)
	{
		self.choices = newChoices;
		self.currentSelectionIndex = (NSUInteger)0;
	}
	return self;
}

- (NSObject *)currentSelection {
	return [choices objectAtIndex:currentSelectionIndex];
}

- (void)dealloc {
	[super dealloc];
}

@end
