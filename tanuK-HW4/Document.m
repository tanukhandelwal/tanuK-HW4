//
//  Document.m
//  tanuK-HW4
//
//  Created by Tanu Khandelwal on 2/14/15.
//  Copyright (c) 2015 UW PCE learning. All rights reserved.
//

#import "Document.h"
#import "TodoList.h"
#import "ViewController.h"


@interface Document ()
//create a property documentTodoList to be passed to the view controller
@property TodoList *documentToDoList;

@end

@implementation Document

// This is called when Control + N is clicked. When a new document is created.
- (instancetype)init {
    self = [super init];
    if (self) {
        self.documentToDoList = [TodoList new];
    }
    return self;
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace {
    return YES;
}

- (void)makeWindowControllers {
    // Override to return the Storyboard file name of the document.
    
    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    NSWindowController *wc = [sb instantiateControllerWithIdentifier:@"Document Window Controller"];
    //window controller has a content view which is owned by view Controller
    
    ViewController *vc = (ViewController*)wc.contentViewController;
    
    //The document and view will share same to do list
    vc.theList = self.documentToDoList;
    [self addWindowController:wc];
    
}


//Saving the data using NSkeyArchiever
- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
   
    NSData *data =[NSKeyedArchiver archivedDataWithRootObject:self.documentToDoList];
    
    return data;
 
    
}

// This is used when control+N is used or when a saved file is opened and not when first time app is run when list is empty
//This method is called only when opening a file.

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {

    id object = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    if([object isKindOfClass:[TodoList class]])
    {
        self.documentToDoList = object;
        return YES;
    }
    else
    return NO;
}

@end
