//
//  FFChoiceTableViewController.m
//  FiftyFinder
//
//  Created by Casey Kolderup on 12/6/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CKChoiceTableViewController.h"

@implementation CKChoiceTableViewController

@synthesize updateAction;
@synthesize updateTarget;
@synthesize choices;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [choices count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero] autorelease];
	cell.textLabel.text = [choices objectAtIndex:[indexPath row]];	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (updateTarget && [updateTarget respondsToSelector:updateAction]) {
		[updateTarget performSelector:updateAction withObject:[choices objectAtIndex:[indexPath row]]];
	}
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
	[super dealloc];
}

@end
