//
//  TodoList.h
//  tanuKTodo
//
//  Created by Tanu Khandelwal on 2/6/15.
//  Copyright (c) 2015 UW PCE learning. All rights reserved.
//

#import <Foundation/Foundation.h>


@class TodoList;
@class TodoItem;

@interface TodoList : NSObject <NSCoding>

// DataStructures
-(NSMutableArray*)allTitles;
-(NSArray*)allItems;


@property (assign) BOOL allowsDuplicates;
@property (copy, nonatomic) NSString *title;

// Add Utility Methods
-(BOOL)canAddItemsWithTitle:(NSString*)title;
-(void)addItem:(TodoItem*)todoItem;
-(BOOL)hasItemWithTitle:(NSString*)title;

-(void)addItemWithTitle:(NSString*)title;

//Remove methods
-(void)removeItem:(TodoItem*)todoItem;

-(BOOL)canRemoveItem:(TodoItem*)todoItem;


-(BOOL)canRemoveItemsWithTitle:(NSString*)title;
-(void)removeItemWithTitle:(NSString*)title;









@end
