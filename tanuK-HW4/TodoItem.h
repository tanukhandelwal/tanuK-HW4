//
//  TodoItem.h
//  tanuKTodo
//
//  Created by Tanu Khandelwal on 2/6/15.
//  Copyright (c) 2015 UW PCE learning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoItem : NSObject 


@property(strong,readwrite)NSString *title;
@property(strong, readwrite)NSString *content;
-(id)initWithTitle:(NSString*)title;
+(instancetype)todoItemWithTitle:(NSString*)title;



@end
