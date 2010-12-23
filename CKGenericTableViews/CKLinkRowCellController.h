//
//  FFLinkRowCellController.h
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

#import <UIKit/UIKit.h>
#import "CKCellController.h"

@interface CKLinkRowCellController : NSObject <CKCellController>
{
	NSString *label;
	Class controllerClass;
	NSObject *model;
}

@property(nonatomic, retain) NSString *label;
@property(nonatomic, assign) Class controllerClass;
@property(nonatomic, retain) NSObject *model;

- (id)initWithLabel:(NSString *)newLabel andModel:(NSObject*)newModel usingControllerClass:(Class)newControllerClass;

@end
