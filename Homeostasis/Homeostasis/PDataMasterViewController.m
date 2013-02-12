//
//  PDataMasterViewController.m
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 2/7/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import "PDataMasterViewController.h"
#import "PDataDetailViewController.h"
#import "DayData.h"
#import "DayDataDataController.h"
#import "AddDayDataViewController.h"

@implementation PDataMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.dataController = [[DayDataDataController alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    //self.navigationItem.rightBarButtonItem =

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataController.countOfList;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"Trying to Add Row Now"); 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    DayData *object = [self.dataController objectInListAtIndex:indexPath.row];
    cell.textLabel.text = [object theDay].description;
    cell.detailTextLabel.text = [object todayTemp].description;

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dataController.currentDataEntries removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

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

- (void)insertNewObject:(DayData *) dd
{
    NSLog(@"A1");
    NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:[self.dataController countOfList]
                                                   inSection:1];
    //NSLog(@"A2");
    //[self.dataController addDayDataToList:dd];
    //NSLog(@"A3");
    //[self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

}

- (IBAction)cancel:(UIStoryboardSegue *)segue

{
    if ([[segue identifier] isEqualToString:@"cancelButton"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (IBAction)done:(UIStoryboardSegue *)segue
{
    NSLog(@"Data Received"); 
    
    if ([[segue identifier] isEqualToString:@"addNewDayReturn"])
    {
        NSLog(@"Data Actually Received");
        AddDayDataViewController *addController = [segue sourceViewController];
        [self insertNewObject:addController.dayOfData];
        
        //[[self tableView] reloadData];
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
    
}


@end
