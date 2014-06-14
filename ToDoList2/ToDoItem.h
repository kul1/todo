//
//  ToDoItem.h
//  ToDoList2
//
//  Created by Kul on 6/13/2557 BE.
//  Copyright (c) 2557 Kul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;


@end
