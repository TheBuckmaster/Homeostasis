//
//  PDataDayViewerViewController.m
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 2/21/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import "PDataDayViewerViewController.h"
#import "DayData.h"

@interface PDataDayViewerViewController ()

@end

@implementation PDataDayViewerViewController

- (id)initWithStyle:(UITableViewStyle)style
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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    [self setViewForthatDay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 4;
}

- (void)setViewForthatDay
{
    
    NSString *tempString = [[NSString alloc] init];
    NSNumber *myNumber = [[NSNumber alloc] initWithFloat:[self.thatDay.todayTemp floatValue]]; 
    tempString = [myNumber stringValue];
    
    NSDateFormatter *dateOutput = [[NSDateFormatter alloc] init];
    NSDateFormatter *timeOutput = [[NSDateFormatter alloc] init];
    
    [dateOutput setDateStyle:NSDateFormatterShortStyle];
    [dateOutput setTimeStyle:NSDateFormatterNoStyle];
    
    [timeOutput setDateStyle:NSDateFormatterNoStyle];
    [timeOutput setTimeStyle:NSDateFormatterMediumStyle];
    
    self.DateDetailOutlet.text = [dateOutput stringFromDate:self.thatDay.theDay];
    self.TimeDetailOutlet.text = [timeOutput stringFromDate:self.thatDay.theDay];
    self.TempDetailOutlet.detailTextLabel.text = tempString;
    
    [self displaySaveState]; 
    
}

- (void)displaySaveState
{
    if([self.thatDay getSaveState] == NO)
    {
        self.SavingOutlet.textLabel.textColor = [UIColor redColor];
        self.SavingOutlet.textLabel.text = @"This record will not be saved.";
    }
    else
    {
        self.SavingOutlet.textLabel.textColor = [UIColor blackColor]; 
        self.SavingOutlet.textLabel.text = @"This record will be saved.";
    }
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
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 3)
    {
        NSLog(@"Selected Switch");
              
        if([self.thatDay getSaveState] == NO)
        {
            [self.thatDay saveThis];
            [self.tableView reloadData];
        }
        else
        {
            [self.thatDay dontSaveThis];
            [self.tableView reloadData];
        }
        
        [self displaySaveState]; 
    }
}

@end
