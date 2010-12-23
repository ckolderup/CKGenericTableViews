//
//  FFTextCellController.m
//  FiftyFinder
//
//  Created by Casey Kolderup on 12/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CKTextRowCellController.h"

@implementation CKTextRowCellController

@synthesize label;
@synthesize placeholder;
@synthesize updateTarget;
@synthesize updateAction;

- (id)initWithLabel:(NSString *)newLabel andPlaceholder:(NSString *)newPlaceholder {
	self = [super init];
	if (self != nil)
	{
		self.label = newLabel;
		self.placeholder = newPlaceholder;
		self.updateTarget = nil;
		self.updateAction = nil;
	}
	return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
	NSArray *subviews = selectedCell.contentView.subviews;
	UITextField *textField = (UITextField *)[subviews objectAtIndex:0];
	[textField becomeFirstResponder];
	
	[tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =	[[[UITableViewCell alloc] initWithFrame:CGRectZero] autorelease];
	CGRect frame = CGRectMake(10, 10, 185, 30);
	UITextField *labelTextField = [[UITextField alloc] initWithFrame:frame];
	[labelTextField setText:label];
	[labelTextField setFont:[UIFont systemFontOfSize:17.0f]];
	[labelTextField setBorderStyle:UITextBorderStyleNone];
	[labelTextField setPlaceholder:placeholder];
	[labelTextField setDelegate:self];
	[labelTextField addTarget:self action:@selector(updateValue:) forControlEvents:UIControlEventEditingChanged];
	[labelTextField setReturnKeyType:UIReturnKeyDone];
	
	labelTextField.textColor = [UIColor blackColor];
	labelTextField.adjustsFontSizeToFitWidth = YES;
	
	
	[cell.contentView addSubview:labelTextField];	
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;	
}

- (void)dealloc {
	[super dealloc];
}

- (void)updateValue:(id)sender {
	label = ((UITextField *)sender).text;
	if (updateTarget && [updateTarget respondsToSelector:updateAction])
		[updateTarget performSelector:updateAction withObject:sender];
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{	
	return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	// hide the keyboard
	[textField resignFirstResponder];
	
	return YES;
}


@end

