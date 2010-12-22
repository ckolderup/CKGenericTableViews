//
//  FFActionRowCellController.m
//  FiftyFinder
//
//  Created by Casey Kolderup on 12/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CKActionRowCellController.h"

@implementation CKActionRowCellController

@synthesize label;
@synthesize image;
@synthesize updateTarget;
@synthesize updateAction;

- (id)initWithLabel:(NSString *)newLabel {
	self = [super init];
	if (self != nil)
	{
		self.label = newLabel;
		self.image = nil;
	}
	return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (updateTarget && [updateTarget respondsToSelector:updateAction]) {
		[updateTarget performSelector:updateAction withObject:self];
	}
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =
		[[[UITableViewCell alloc]
		  initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil]
		 autorelease];
	
    // Configure the cell
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.textLabel.text = label;
	cell.imageView.image = image;
	if (image) {
		cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
		cell.indentationLevel = 1;
	}
	
    return cell;	
}

- (void)dealloc {
	[super dealloc];
}

@end
