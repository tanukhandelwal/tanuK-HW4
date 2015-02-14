//
//  TodoList.m
//  tanuKTodo
//
//  Created by Tanu Khandelwal on 2/6/15.
//  Copyright (c) 2015 UW PCE learning. All rights reserved.
//



#import "TodoList.h"
#import "TodoItem.h"
@interface TodoList()
@property (strong, nonatomic)NSMutableArray* myArray;

@end

@implementation TodoList

-(id)init
{
    self = [super init];
    if (self) {        
        self.myArray = [[NSMutableArray alloc]init];
    }
    return self;
    
}



-(NSArray*)allTitles
{
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for(TodoItem *myItem in self.myArray)
    {
        [newArray addObject:myItem.title];
    }
   
    return newArray;
}




-(NSArray*)allItems
{
    NSArray *arr = [[NSArray alloc]initWithArray:self.myArray];
    return arr;
    
}

-(BOOL)canAddItemsWithTitle:(NSString*)title
{
    if([title isEqualToString:@""])
    {
        return NO;
    }
    
    if(self.allowsDuplicates)
    {
        
        return YES;
    }
    //Dont allow if it has a title with the same name
    
    return ![self hasItemWithTitle:title];
    
}

-(void)addItem:(TodoItem*)todoItem
{
    [self.myArray addObject:todoItem];
}


-(BOOL)hasItemWithTitle:(NSString*)title
{
     for(TodoItem *item in self.allItems)
     {
         if([item.title isEqualToString:title])
             return YES;
     }
    return NO;
}

-(void)addItemWithTitle:(NSString*)title{
    TodoItem *myItem = [[TodoItem alloc]initWithTitle:title];
    [self.myArray addObject:myItem];
    
}


//Remove methods

-(void)removeItem:(TodoItem*)todoItem
{
    NSUInteger index = [[self myArray] indexOfObject:todoItem.title];
    [[self myArray] removeObjectAtIndex:index];
                        
}

-(BOOL)canRemoveItemsWithTitle:(NSString*)title
{
    if ([self hasItemWithTitle:title])
    {
        return YES;
    }
    else
        return NO;
    
}

-(void)removeItemWithTitle:(NSString*)title
{
    if([self canRemoveItemsWithTitle:title])
    {
        [self removeItem:[TodoItem todoItemWithTitle:title]];;
    }
    
        
}

-(BOOL)canRemoveItem:(TodoItem*)todoItem
{
    NSString *titleString = todoItem.title;
    return [self canRemoveItemsWithTitle:titleString];
}


//Document based Methods

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.myArray forKey:@"myArray"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.myArray =[aDecoder decodeObjectForKey:@"myArray"];
    return self;
}








@end
