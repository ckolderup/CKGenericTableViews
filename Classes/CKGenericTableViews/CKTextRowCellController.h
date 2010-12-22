//
//  FFTextCellController.h
//  FiftyFinder
//
//  Created by Casey Kolderup on 12/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKCellController.h"

@interface CKTextRowCellController : NSObject <CKCellController, UITextFieldDelegate>
{
	NSString *label;
	NSString *placeholder;
	
	SEL updateAction;
	id updateTarget;
}

@property (nonatomic, retain) NSString *label;
@property (nonatomic, retain) NSString *placeholder;
@property (nonatomic, assign) SEL updateAction;
@property (nonatomic, assign) id updateTarget;

- (id)initWithLabel:(NSString *)newLabel andPlaceholder:(NSString *)newPlaceholder;
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField;
- (BOOL)textFieldShouldReturn:(UITextField *)textField;

- (void)updateValue:(id)sender;

@end
