//
//  ToDoListTableViewController.m
//  ToDoList
//
//  Created by David Manuntag on 2015-01-28.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "ToDoListTableViewController.h"
#import "ToDoItem.h"
#import "AddToDoItemViewController.h"


@interface ToDoListTableViewController ()


@property NSMutableArray* toDoListItems;

@end

@implementation ToDoListTableViewController


-(IBAction)unWindToList:(UIStoryboardSegue*)segue {
    
    
    AddToDoItemViewController * source = [segue sourceViewController];
    
    ToDoItem * item = source.toDoItem;
    
    if (item!=nil) {
        
        [self.toDoListItems addObject:item];
        
        [self.tableView reloadData];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    self.toDoListItems = [[NSMutableArray alloc]init];
    
    [self loadToDoItems];

}


-(void)loadToDoItems {
    
    ToDoItem * item1 = [[ToDoItem alloc]init];
    item1.itemName = @"Milk";
    
    ToDoItem * item2 = [[ToDoItem alloc]init];
    item2.itemName = @"Eggs";
    
    ToDoItem * item3 = [[ToDoItem alloc]init];
    item3.itemName = @"Chicken";
    
    [self.toDoListItems addObject:item1];
    [self.toDoListItems addObject:item2];
    [self.toDoListItems addObject:item3];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.toDoListItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    ToDoItem * todoItem = [self.toDoListItems objectAtIndex:indexPath.row];
    cell.textLabel.text = todoItem.itemName;
    
    
    if (todoItem.completed) {
        
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else {
        
        cell.accessoryType = UITableViewCellAccessoryNone;
    }

    return cell;
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [self.toDoListItems removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
        
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    ToDoItem * tappedItem = [self.toDoListItems objectAtIndex:indexPath.row];
    
    tappedItem.completed = !tappedItem.completed;
    
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
    
}

@end
