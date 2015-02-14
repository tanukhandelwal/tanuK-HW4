//
//  ViewController.m
//  tanuK-HW4
//
//  Created by Tanu Khandelwal on 2/14/15.
//  Copyright (c) 2015 UW PCE learning. All rights reserved.
//

#import "ViewController.h"
#import "TodoList.h"
#import "TodoItem.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource= self;
    self.inputText.delegate = self;
    self.inputText.enabled = NO;
    
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    NSArray *arr = [self.theList allItems];
    return [arr count];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSTableCellView *nc = [tableView makeViewWithIdentifier:@"Cell" owner:nil];

    NSArray *nsArray = [self.theList allItems];
    TodoItem *myItem = nsArray[row];
    nc.textField.stringValue = myItem.title;
    return nc;
 
}

- (IBAction)addItems:(id)sender {
    self.inputText.enabled = YES;
    NSString *myString = self.inputText.stringValue;
  //  TodoItem *newItem = [TodoItem todoItemWithTitle:@"NewItem"];
    [self.theList addItemWithTitle:myString];
    [self.tableView reloadData];


}





@end
