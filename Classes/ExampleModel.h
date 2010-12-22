//
//  Model.h
//  CKGenericTableViews
//
//  Created by Casey Kolderup on 12/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ExampleModel : NSObject {
	NSArray *choices;
	NSString *selectedChoice;
	NSString *prefLabel;
	BOOL prefState;
	NSString *enteredText;
	NSArray *exclusiveSelectChoices;
	NSUInteger exclusiveSelectCurrentSelection;

}

@property (retain) NSArray *choices;
@property (retain) NSString *selectedChoice;
@property (retain) NSString *prefLabel;
@property (assign) BOOL prefState;
@property (retain) NSString *enteredText;
@property (retain) NSArray *exclusiveSelectChoices;
@property (assign) NSUInteger exclusiveSelectCurrentSelection;

@end
