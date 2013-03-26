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
#import "PDataDayViewerViewController.h"
#import "PDataAddNewItemViewController.h"
#import "PDataAddNewDataStep2Controller.h"

@class EKEvent; 
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
    [self.dataController loadDataFromDisk];
    [self.tableView reloadData];
    
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground:)name:UIApplicationDidEnterBackgroundNotification object:app];
    
    //The 'store' for reminder events used by the app.
    EKEventStore *store = [[EKEventStore alloc] init];
    [store requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError *error)
    {
        if(granted == YES)
            NSLog(@"Have Access.");
        else
            NSLog(@"Do not have Access.");
    }];
    
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    DayData *object = [self.dataController objectInListAtIndex:indexPath.row];
    
    cell.accessoryType = UITableViewCellAccessoryNone; 
    
    //Perhaps we want to do something particular if the user reports a particularly high temp.
    //This variable specifies a value above which the text will turn red. 
    NSNumber *warningValue = [[NSNumber alloc] initWithDouble:100.0];
    NSDate *date = [object theDay];
    
    //This block controls formatting of the date, such that we can be assured of cell space
    //in case it is needed for future offerings. 
    NSDateFormatter *tableFormat = [[NSDateFormatter alloc] init];
    [tableFormat setDateStyle:NSDateFormatterShortStyle];
    [tableFormat setTimeStyle:NSDateFormatterShortStyle];
    //This should be considered the normal behavior.
    //Alternately, comment in the following instead,
    //which will not display the time at all:
    //[tableFormat setTimeStyle:NSDateFormatterNoStyle];
    
    //Finally, we finish the formatting for the date. 
    NSString *niceDate = [tableFormat stringFromDate:date];
    
    //These lines programatically adjust the contents of the cell's members. 
    cell.textLabel.text = niceDate; 
    cell.detailTextLabel.text = [object todayTemp].description;
    if ([object.todayTemp doubleValue] > [warningValue doubleValue])
    {
        cell.detailTextLabel.textColor = [UIColor redColor];
    }
    
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
        [self.dataController saveDataToDisk];
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


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"detailView"])
    {
        DayData *dayintended =
        [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
        PDataDayViewerViewController *dayViewer = [segue destinationViewController];
        dayViewer.thatDay = dayintended;

    }
}


- (void)insertNewObject:(DayData *) dd
{
    NSIndexPath *newIndexPath =[NSIndexPath indexPathForRow:[self.dataController countOfList]inSection:0];
    [self.dataController addDayDataToList:dd];
    [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

}

- (IBAction)cancel:(UIStoryboardSegue *)segue

{
    if ([[segue identifier] isEqualToString:@"cancelButton"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (IBAction)saveNewItem:(UIStoryboardSegue *)segue
{   
    PDataAddNewDataStep2Controller *addController = [segue sourceViewController];
    [self insertNewObject:addController.theDay]; 
    [self dismissViewControllerAnimated:YES completion:NULL];
    [self.dataController saveDataToDisk];
}


- (IBAction)done:(UIStoryboardSegue *)segue
{
    
    if ([[segue identifier] isEqualToString:@"confirmDayReturn"])
    {
        [self dismissViewControllerAnimated:YES completion:NULL];
        [[self tableView] reloadData];
        //[self.dataController saveDataToDisk];
    }
    
}

- (void)applicationDidEnterBackground:(NSNotification *) notification{

    //[self.dataController saveDataToDisk];
}





@end
