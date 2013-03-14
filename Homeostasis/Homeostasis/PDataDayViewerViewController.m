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
    return 5;
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
    
    NSLog(@"Feel = %f",self.thatDay.feelingLevel.floatValue);
    
    NSString *feelString = [[NSString alloc]init];
    
    feelString = @"blegh";
    if([self.thatDay.feelingLevel floatValue] < 1.0)
        feelString = @"Gross";
    else
    {
        if([self.thatDay.feelingLevel floatValue] < 2.0)
        {
            feelString = @"Poor";
        }
        else
        {
            if([self.thatDay.feelingLevel floatValue] < 3.0)
            {
                feelString = @"Mediocre";
            }
            else
            {
                if([self.thatDay.feelingLevel floatValue ] < 4.0)
                {
                    feelString = @"Meh";
                }
                else
                {
                    if([self.thatDay.feelingLevel floatValue] < 5.0)
                    {
                        feelString = @"Good";
                    }
                    else
                    {
                        feelString = @"Great!";
                    }
                }
            }
        }
    }
    
    NSLog(@" %@",feelString); 
    self.FeelDetailOutlet.text = feelString;
    
    if(self.thatDay.cough)
        self.CoughOutlet.text = @"Yes";
    else
        self.CoughOutlet.text = @"No"; 
    
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

    
}

@end
