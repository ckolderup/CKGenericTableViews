//
//  FFSwitchRowCellController.m
//
//  Created by Matt Gallagher on 27/12/08.
//  Copyright 2008 Matt Gallagher. All rights reserved.
//
//  Permission is given to use this source code file, free of charge, in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

#import "CKSwitchRowCellController.h"

@implementation CKSwitchRowCellController

@synthesize label;
@synthesize state;
@synthesize updateTarget;
@synthesize updateAction;

//
// init
//
// Init method for the object.
//
- (id)initWithKey:(NSString *)newLabel andState:(BOOL)newState
{
	self = [super init];
	if (self != nil)
	{
		self.label = newLabel;
		self.state = newState;
		self.updateAction = nil;
		self.updateTarget = nil;
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
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	cell.textLabel.text = label;

	UISwitch *switchCtrl = [[UISwitch alloc] init];
	switchCtrl.on = state;
	[switchCtrl addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
	
	cell.accessoryView = switchCtrl;

    return cell;
}

- (void)switchAction:(id)sender {
	UISwitch *switchCtrl = (UISwitch *)sender;
	state = !state;
	switchCtrl.on = state; 

	if (updateTarget && [updateTarget respondsToSelector:updateAction])
		[updateTarget performSelector:updateAction withObject:self];
}

@end
