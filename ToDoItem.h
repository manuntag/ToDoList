//
//  ToDoItem.h
//  ToDoList
//
//  Created by David Manuntag on 2015-01-28.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property (nonatomic, strong) NSString * itemName;
@property BOOL completed;
@property (readonly) NSDate * dateCreated;

@end
