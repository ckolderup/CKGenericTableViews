//
//  RootViewController.h
//  CKGenericTableViews
//
//  Created by Casey Kolderup on 12/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKGenericTableViewController.h"
#import "ExampleModel.h"

@interface RootViewController : CKGenericTableViewController {
}

- (void)actionFired:(id)sender;
- (void)choiceMade:(id)sender;
- (void)switchFlipped:(id)sender;
- (void)enteredText:(id)sender;
- (void)changedSelection:(id)sender;

@end
