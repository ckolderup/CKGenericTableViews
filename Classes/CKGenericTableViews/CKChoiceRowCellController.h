//
//  FFChoiceRowCellController.h
//  FiftyFinder
//
//  Created by Casey Kolderup on 12/6/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKCellController.h"

@interface CKChoiceRowCellController : NSObject <CKCellController>
{
	NSString *title;
	NSString *label;
	NSString *placeholder;
	NSArray *choices;
	
	SEL updateAction;
	id updateTarget;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSArray *choices;
@property (nonatomic, retain) NSString *label;
@property (nonatomic, retain) NSString *placeholder;
@property (nonatomic, assign) SEL updateAction;
@property (nonatomic, assign) id updateTarget;

- (id)initWithLabel:(NSString *)newLabel andPlaceholder:(NSString *)newPlaceholder andChoices:(NSArray *)newChoices;

@end

