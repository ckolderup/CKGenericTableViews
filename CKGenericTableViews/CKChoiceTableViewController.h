//
//  FFChoiceTableViewController.h
//  FiftyFinder
//
//  Created by Casey Kolderup on 12/6/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKGenericTableViewController.h"

@interface CKChoiceTableViewController : CKGenericTableViewController {
	SEL updateAction;
	id updateTarget;
	
	NSArray *choices;
}

@property (nonatomic, assign) SEL updateAction;
@property (nonatomic, assign) id updateTarget;
@property (nonatomic, retain) NSArray *choices;

@end
