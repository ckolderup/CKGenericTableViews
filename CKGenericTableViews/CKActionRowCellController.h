//
//  FFActionRowCellController.h
//  FiftyFinder
//
//  Created by Casey Kolderup on 12/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKCellController.h"

@interface CKActionRowCellController : NSObject <CKCellController>
{
	NSString *label;
	UIImage *image;
	SEL updateAction;
	id updateTarget;
}

@property (nonatomic, retain) NSString *label;
@property (nonatomic, assign) SEL updateAction;
@property (nonatomic, assign) id updateTarget;
@property (nonatomic, retain) UIImage *image;

- (id)initWithLabel:(NSString *)newLabel;

@end

