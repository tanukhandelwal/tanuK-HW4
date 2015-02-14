//
//  TodoItem.m
//  tanuKTodo
//
//  Created by Tanu Khandelwal on 2/6/15.
//  Copyright (c) 2015 UW PCE learning. All rights reserved.
//

#import "TodoItem.h"

@implementation TodoItem

-(instancetype)initWithTitle:(NSString*)title;
{
    self = [super init];
    if(self)
    {
        _title = title;
        _content = @"";
        
    }
    return self;
}

-(instancetype)init
{
    return [self initWithTitle:@""];
}

+(instancetype)todoItemWithTitle:(NSString*)title
{
    TodoItem *item = [[self alloc] init];
    item.title = title;
    return item;
}

@end
