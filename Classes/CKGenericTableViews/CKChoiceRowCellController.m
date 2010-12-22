//
//  FFChoiceRowCellController.m
//  FiftyFinder
//
//  Created by Casey Kolderup on 12/6/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CKChoiceRowCellController.h"
#import "CKChoiceTableViewController.h"

@implementation CKChoiceRowCellController

@synthesize title;
@synthesize choices;
@synthesize placeholder;
@synthesize label;
@synthesize updateTarget;
@synthesize updateAction;

- (id)initWithLabel:(NSString *)newLabel andPlaceholder:(NSString *)newPlaceholder andChoices:(NSArray *)newChoices {
	self = [super init];
	if (self != nil)
	{
		self.label = newLabel;
		self.choices = newChoices;
		self.title = newPlaceholder;
		self.placeholder = newPlaceholder;
		self.updateAction = nil;
		self.updateTarget = nil;
	}
	return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewController *tableViewController = (UITableViewController *)tableView.dataSource;
	
	CKChoiceTableViewController *choiceTableViewController = [[CKChoiceTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
	choiceTableViewController.title = title;
	choiceTableViewController.choices = choices;
	choiceTableViewController.updateTarget = updateTarget;
	choiceTableViewController.updateAction = updateAction;
	[tableViewController.navigationController pushViewController:choiceTableViewController animated:YES];
	[choiceTableViewController release];
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =
		[[[UITableViewCell alloc]
		  initWithFrame:CGRectZero]
		 autorelease];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
    // Configure the cell
	if (label != nil) {
		cell.textLabel.textColor = [UIColor blackColor];
		cell.textLabel.text = label;
	} else {
		cell.textLabel.textColor = [UIColor grayColor];
		cell.textLabel.text = placeholder;
	}
	
    return cell;	
}

- (void)dealloc {
	[super dealloc];
}

@end
