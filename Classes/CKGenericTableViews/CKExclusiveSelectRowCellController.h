//
//  FFExclusiveSelectRowCellController.h
//  FiftyFinder
//
//  Created by Casey Kolderup on 12/6/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKCellController.h"
#import "CKExclusiveSelectModel.h"

@interface CKExclusiveSelectRowCellController : NSObject <CKCellController>
{
	NSString *label;
	
	SEL updateAction;
	id updateTarget;
	CKExclusiveSelectModel *model;
}

@property (nonatomic, retain) NSString *label;
@property (nonatomic, assign) SEL updateAction;
@property (nonatomic, assign) id updateTarget;
@property (nonatomic, retain) CKExclusiveSelectModel *model;

- (id)initWithLabel:(NSString *)newLabel andModel:(CKExclusiveSelectModel *)newModel;

@end


