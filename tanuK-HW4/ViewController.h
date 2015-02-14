//
//  ViewController.h
//  tanuK-HW4
//
//  Created by Tanu Khandelwal on 2/14/15.
//  Copyright (c) 2015 UW PCE learning. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TodoList.h"

@interface ViewController : NSViewController <NSTableViewDelegate,NSTextFieldDelegate,NSTableViewDataSource>


//View controller should have a property called list
@property(strong,nonatomic)TodoList *theList;


//UI components

@property (weak) IBOutlet NSTextField *inputText;
@property (weak) IBOutlet NSTableView *tableView;

@property (weak) IBOutlet NSButton *addItems;
@property (weak) IBOutlet NSButton *removeItems;

@end

