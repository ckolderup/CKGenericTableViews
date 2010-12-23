//
//  FFExclusiveSelectModel.h
//  FiftyFinder
//
//  Created by Casey Kolderup on 12/6/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CKExclusiveSelectModel : NSObject {
	NSArray *choices;
	NSUInteger currentSelectionIndex;
}

@property (nonatomic, assign) NSUInteger currentSelectionIndex;
@property (nonatomic, retain) NSArray *choices;

- (id)initWithChoices:(NSArray *)newChoices;
- (void)setCurrentSelectionIndex:(NSUInteger)newIndex;
- (NSObject *)currentSelection;

@end
