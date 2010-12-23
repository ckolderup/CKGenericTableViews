//
//  FFExclusiveSelectRowCellController.m
//  FiftyFinder
//
//  Created by Casey Kolderup on 12/6/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CKExclusiveSelectRowCellController.h"
#import "CKGenericTableViewController.h"

@implementation CKExclusiveSelectRowCellController

@synthesize label;
@synthesize updateTarget;
@synthesize updateAction;
@synthesize model;

//
// init
//
// Init method for the object.
//
- (id)initWithLabel:(NSString *)newLabel andModel:(CKExclusiveSelectModel *)newModel
{
	self = [super init];
	if (self != nil)
	{
		self.label = newLabel;
		self.model = newModel;
	}
	return self;
}

//
// dealloc
//
// Releases instance memory.
//
- (void)dealloc
{
	[super dealloc];
}

//
// tableView:cellForRowAtIndexPath:
//
// Returns the cell for a given indexPath.
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = 
		[[[UITableViewCell alloc]
		  initWithFrame:CGRectZero]
		 autorelease];
	
	// Configure the cell
	cell.textLabel.text = label;
	
	if (model.currentSelectionIndex == indexPath.row)
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	else
		cell.accessoryType = UITableViewCellAccessoryNone;
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSIndexPath *currentSelectedPath = [NSIndexPath indexPathForRow:model.currentSelectionIndex inSection:indexPath.section];
	NSMutableArray *rowsArray = [NSMutableArray arrayWithObjects:indexPath, nil];
	
	if ([currentSelectedPath compare:indexPath] != NSOrderedSame) {
		[rowsArray addObject:currentSelectedPath];
		model.currentSelectionIndex = indexPath.row;	
		if (updateTarget && [updateTarget respondsToSelector:updateAction])
			[updateTarget performSelector:updateAction withObject:[model currentSelection]];
	}
	
	[tableView reloadRowsAtIndexPaths:rowsArray withRowAnimation:UITableViewRowAnimationNone];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
