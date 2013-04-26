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
    /*
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    [notification setAlertBody:@"I AM A NOTIFICATION"];
    [notification setFireDate:[NSDate dateWithTimeIntervalSinceNow:30]];
    [notification setTimeZone:[NSTimeZone defaultTimeZone]];
    
    if(notification == nil)
        NSLog(@"Is NIL");
    
    [app setScheduledLocalNotifications:[NSArray arrayWithObject:notification]];
    */
     
    /* COMMENTING OUT ALL REMINDERS RELATED FUNCTIONALITY. 
    
    //The 'store' for reminder events used by the app.
    EKEventStore *store = [[EKEventStore alloc] init];
    [store requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError *error)
    {
        if(granted == YES)
        {
            NSLog(@"Have Access.");
            
            
            //Code for creating reminders.
            EKReminder *takeStuffTomorrow = [EKReminder reminderWithEventStore:store];           
            takeStuffTomorrow.calendar = store.defaultCalendarForNewReminders;
            NSDate *tomorrowDate = [[NSDate alloc]initWithTimeIntervalSinceNow:86400.00];
            NSDateFormatter *reminderEnd = [[NSDateFormatter alloc]init];
            [reminderEnd setDateStyle:NSDateFormatterShortStyle];
            [reminderEnd setTimeStyle:NSDateFormatterNoStyle]; 
            
            //reminderEnd.dateStyle = NSDateFormatterShortStyle;
            //reminderEnd.timeStyle = NSDateFormatterNoStyle;
            NSString *endString = [reminderEnd stringFromDate:tomorrowDate];
            NSString *titleString = @"Report Health Data for: ";
            titleString = [titleString stringByAppendingString:endString];
            takeStuffTomorrow.title = titleString;
            takeStuffTomorrow.completionDate = [[NSDate alloc]initWithTimeIntervalSinceNow:86400.00];
            NSLog(@"%@",takeStuffTomorrow.title);
            
            NSError *err;
            if([store saveReminder:takeStuffTomorrow commit:YES error:&err])
                NSLog(@"Success!");
            else
                NSLog(@"Failure!");
            
            
            
            
            //Code for deleting reminders. 
            
            
            NSPredicate *predicate = [store predicateForRemindersInCalendars:nil];
            [store fetchRemindersMatchingPredicate:predicate completion:^(NSArray *reminders)
            {
                for (EKReminder *reminder in reminders) {
                    bool isMyReminder = [reminder.title hasPrefix:@"Report Health Data for: "];
                    //NSLog(@"%@ %@", reminder.title, isMyReminder? @"Yes":@"No");
                    if(isMyReminder)
                    {
                        NSError *err;
                        NSLog(@"%@ is being deleted.",reminder.title);
                        
                        if([store removeReminder:reminder commit:YES error:&err])
                            NSLog(@"Success");
                        else
                            NSLog(@"Failure");
                    }
                }
            }];
            
             
            
            
        }
        else
        {
            NSLog(@"Do not have Access.");

        }
    }];

     */
    

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
    //This variable specifies a value at or above which the text will turn red. 
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
    if ([object.todayTemp doubleValue] >= [warningValue doubleValue])
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
    [self.tableView reloadData];

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
    if([self.dataController dataForToday]){
        ;
        
    }

}


- (IBAction)done:(UIStoryboardSegue *)segue
{
    
    if ([[segue identifier] isEqualToString:@"confirmDayReturn"])
    {
        [self dismissViewControllerAnimated:YES completion:NULL];
        [[self tableView] reloadData];
        
    }
    
}

- (void)applicationDidEnterBackground:(NSNotification *) notification{

    
}





@end
