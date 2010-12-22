//
//  RootViewController.m
//  CKGenericTableViews
//
//  Created by Casey Kolderup on 12/21/10.
//  Copyright 2010 Casey Kolderup. All rights reserved.
//

#import "RootViewController.h"
#import "CKActionRowCellController.h"
#import "CKChoiceRowCellController.h"
#import "CKLinkRowCellController.h"
#import "CKSwitchRowCellController.h"
#import "CKTextRowCellController.h"
#import "CKExclusiveSelectRowCellController.h"
#import "ExampleChildViewController.h"

@implementation RootViewController

- (void)constructTableGroups {
	ExampleModel *exampleModel = (ExampleModel *)model;
	
	NSMutableArray *singleCells = [NSMutableArray array];
	
	CKActionRowCellController *actionRow = [[[CKActionRowCellController alloc] initWithLabel:@"Action Row"] autorelease];
	actionRow.updateAction = @selector(actionFired:);
	actionRow.updateTarget = self;
	[singleCells addObject:actionRow];
	
	CKChoiceRowCellController *choiceRow = [[[CKChoiceRowCellController alloc] initWithLabel:exampleModel.selectedChoice andPlaceholder:@"Make a choice" andChoices:exampleModel.choices] autorelease];
	choiceRow.updateAction = @selector(choiceMade:);
	choiceRow.updateTarget = self;
	[singleCells addObject:choiceRow];
	
	CKLinkRowCellController *linkRow = [[[CKLinkRowCellController alloc] initWithLabel:@"Link Row" andModel:exampleModel usingControllerClass:[ExampleChildViewController class]] autorelease];
	[singleCells addObject:linkRow];
	
	CKSwitchRowCellController *switchRow = [[[CKSwitchRowCellController alloc] initWithKey:exampleModel.prefLabel andState:exampleModel.prefState] autorelease];
	switchRow.updateAction = @selector(switchFlipped:);
	switchRow.updateTarget = self;
	[singleCells addObject:switchRow];
	
	CKTextRowCellController *textRow = [[[CKTextRowCellController alloc] initWithLabel:exampleModel.enteredText andPlaceholder:@"Enter some text"] autorelease];
	textRow.updateAction = @selector(enteredText:);
	textRow.updateTarget = self;
	[singleCells addObject:textRow];
	
	
	NSMutableArray *exclusiveSelectCells = [NSMutableArray array];
	
	CKExclusiveSelectModel *exclusiveSelectModel = [[[CKExclusiveSelectModel alloc] initWithChoices:exampleModel.exclusiveSelectChoices] autorelease];
	[exclusiveSelectModel setCurrentSelectionIndex:exampleModel.exclusiveSelectCurrentSelection];
	
	for (NSString *label in exampleModel.exclusiveSelectChoices) {
		CKExclusiveSelectRowCellController *exclusiveSelectRow = [[[CKExclusiveSelectRowCellController alloc] initWithLabel:label andModel:exclusiveSelectModel] autorelease];
		exclusiveSelectRow.updateAction = @selector(changedSelection:);
		exclusiveSelectRow.updateTarget = self;
		[exclusiveSelectCells addObject:exclusiveSelectRow];
	}
	
	
	tableGroups = [[NSArray arrayWithObjects:singleCells, exclusiveSelectCells, nil] retain];
	tableHeaders = [[NSArray arrayWithObjects:@"Various Controls", @"Exclusive Select", nil] retain];
	tableFooters = [[NSArray arrayWithObjects:@"Footer text", @"", nil] retain];
}

#pragma mark Update actions

- (void)actionFired:(id)sender {
	UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Action" message:@"An action row was pressed." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil] autorelease];
	[alert show];
}

- (void)choiceMade:(id)sender {
	ExampleModel *exampleModel = (ExampleModel *)model;
	exampleModel.selectedChoice = (NSString *)sender;
	NSLog(@"Choice made: %@", (NSString *)sender);
}

- (void)switchFlipped:(id)sender {
	ExampleModel *exampleModel = (ExampleModel *)model;
	CKSwitchRowCellController *switchRow = (CKSwitchRowCellController *)sender;
	exampleModel.prefState = switchRow.state;
	NSLog(@"State is now %@", (exampleModel.prefState ? @"ON" : @"OFF"));
}

- (void)enteredText:(id)sender {
	UITextField *textField = (UITextField *)sender;
	ExampleModel *exampleModel = (ExampleModel *)model;
	exampleModel.enteredText = textField.text;
	NSLog(@"Text entered is currently: %@", textField.text);
}

- (void)changedSelection:(id)sender {
	ExampleModel *exampleModel = (ExampleModel *)model;
	exampleModel.exclusiveSelectCurrentSelection = [exampleModel.exclusiveSelectChoices indexOfObject:sender];
	NSLog(@"Now selected: %@", (NSString *)sender);
}

#pragma mark -
#pragma mark View management

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.tableView initWithFrame:self.tableView.frame style:UITableViewStyleGrouped];
	self.title = @"Custom Table View Cells";	
	model = [[ExampleModel alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self updateAndReload];
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [super dealloc];
}

@end

