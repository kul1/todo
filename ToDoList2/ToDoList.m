//
//  ToDoList.m
//  ToDoList2
//
//  Created by Kul on 6/13/2557 BE.
//  Copyright (c) 2557 Kul. All rights reserved.
//

#import "ToDoList.h"
#import "ToDoItem.h"
#import "AddToDoItem.h"
@interface ToDoList ()

@property NSMutableArray *toDoItems;

//@property NSString *itemName;
//@property BOOL completed;
//@property (readonly) NSDate *creationDate;

@end

@implementation ToDoList

- (void)loadInitialData {
    ToDoItem *item1 = [[ToDoItem alloc] init];
    item1.itemName = @"1 Buy milk";
    [self.toDoItems addObject:item1];
    ToDoItem *item2 = [[ToDoItem alloc] init];
    item2.itemName = @"2 Buy eggs";
    [self.toDoItems addObject:item2];
    ToDoItem *item3 = [[ToDoItem alloc] init];
    item3.itemName = @"3 Read a book";
    [self.toDoItems addObject:item3];
    ToDoItem *item4 = [[ToDoItem alloc] init];
    item4.itemName = @"4 Buy milk";
    [self.toDoItems addObject:item1];
    ToDoItem *item5 = [[ToDoItem alloc] init];
    item5.itemName = @"5 Buy eggs";
    [self.toDoItems addObject:item2];
    ToDoItem *item6 = [[ToDoItem alloc] init];
    item6.itemName = @"6 Read a book";
    [self.toDoItems addObject:item3];
    ToDoItem *item7 = [[ToDoItem alloc] init];
    item7.itemName = @"7 Buy milk";
    [self.toDoItems addObject:item1];
    ToDoItem *item8 = [[ToDoItem alloc] init];
    item8.itemName = @"8 Buy eggs";
    [self.toDoItems addObject:item2];
    ToDoItem *item9 = [[ToDoItem alloc] init];
    item9.itemName = @"9 Read a book";
    [self.toDoItems addObject:item3];
    ToDoItem *item10 = [[ToDoItem alloc] init];
    item10.itemName = @"10 Buy milk";
    [self.toDoItems addObject:item1];
    ToDoItem *item11 = [[ToDoItem alloc] init];
    item11.itemName = @"11 Buy eggs";
    [self.toDoItems addObject:item2];
    ToDoItem *item12 = [[ToDoItem alloc] init];
    item12.itemName = @"12Read a book";
    [self.toDoItems addObject:item3];
}



- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    AddToDoItem *source = [segue sourceViewController];
    ToDoItem *item = source.toDoItem;
    if (item != nil) {
        [self.toDoItems addObject:item];
        [self.tableView reloadData];
    }
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.toDoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
    
     //Uncomment the following line to preserve selection between presentations.
//     self.clearsSelectionOnViewWillAppear = NO;
    
     //Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
//     Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
//     Return the number of rows in the section.
    return [self.toDoItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    ToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    
    if (toDoItem.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;

}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}
@end
