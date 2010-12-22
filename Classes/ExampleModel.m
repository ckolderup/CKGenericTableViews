//
//  Model.m
//  CKGenericTableViews
//
//  Created by Casey Kolderup on 12/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ExampleModel.h"


@implementation ExampleModel

@synthesize choices;
@synthesize selectedChoice;
@synthesize prefLabel;
@synthesize prefState;
@synthesize enteredText;
@synthesize exclusiveSelectChoices;
@synthesize exclusiveSelectCurrentSelection;

- (id)init {
	if (self = [super init]) {
		self.choices = [[NSArray alloc] initWithObjects:@"Brains", @"Brawn", @"Booty", nil];
		self.selectedChoice = nil;
		self.prefLabel = [[NSString alloc] initWithString:@"Mustache"];
		self.prefState = NO;
		self.enteredText = nil;
		self.exclusiveSelectChoices = [[NSArray alloc] initWithObjects:@"Earth",@"Wind",@"Fire",@"Water",@"Heart", nil];
		self.exclusiveSelectCurrentSelection = 4;
	}
	return self;
}

- (void)dealloc {
	[super dealloc];
}

@end
