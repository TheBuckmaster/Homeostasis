//
//  PDataAddNewItemSuperIntegratedViewController.m
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 5/1/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import "PDataAddNewItemSuperIntegratedViewController.h"

@interface PDataAddNewItemSuperIntegratedViewController ()

@end

@implementation PDataAddNewItemSuperIntegratedViewController

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
    
    [self showTemp];
    [self showFeel];
    
    self.theDay = [[DayData alloc]init]; 
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0)
        return 5;
    return 1;
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (IBAction)coughYes:(id)sender {
    self.coughCell.accessoryType = UITableViewCellAccessoryCheckmark; 
}
- (IBAction)acheYes:(id)sender {
        self.acheCell.accessoryType = UITableViewCellAccessoryCheckmark;
}
- (IBAction)fatigueYes:(id)sender {
        self.fatigueCell.accessoryType = UITableViewCellAccessoryCheckmark;
}
- (IBAction)fatigueNo:(id)sender {
    self.fatigueCell.accessoryType = UITableViewCellAccessoryNone; 
}
- (IBAction)coughNo:(id)sender {
    self.coughCell.accessoryType = UITableViewCellAccessoryNone;
}
- (IBAction)acheNo:(id)sender {
        self.acheCell.accessoryType = UITableViewCellAccessoryNone;
}

- (void)showTemp
{
    NSNumber *localValue = [[NSNumber alloc]initWithDouble:self.stepTemp.value];
    
    if (localValue.doubleValue > 99.9)
    {
        NSLog(@"%f", localValue.doubleValue); 
        self.displayTemp.textColor = [UIColor redColor];
    }
    else
    {
        NSLog(@"%f", localValue.doubleValue); 
        self.displayTemp.textColor = [UIColor blackColor]; 
    }
    
    NSNumberFormatter *nf = [[NSNumberFormatter alloc]init];
    [nf setMaximumFractionDigits:1];
    [nf setRoundingMode:NSNumberFormatterRoundHalfEven];
    self.displayTemp.text = [nf stringFromNumber:localValue];
}
- (IBAction)newTemp:(id)sender {
    [self showTemp]; 
}

- (IBAction)newFeel:(id)sender {
    [self showFeel]; 
}

- (void)showFeel
{
    NSNumber *feelingValue = [[NSNumber alloc]initWithFloat:self.slideFeel.value];
    NSString *feelString = [[NSString alloc]init];
    if([feelingValue floatValue] == 0.0)
    {
        feelString = @"Terrible";
    }
    else
    {
        if([feelingValue floatValue] < 1.0)
        {
            feelString = @"Gross";
        }
        else
        {
            if([feelingValue floatValue] < 2.0)
            {
                feelString = @"Poor";
            }
            else
            {
                if([feelingValue floatValue] < 3.0)
                {
                    feelString = @"Mediocre";
                }
                else
                {
                    if([feelingValue floatValue] < 4.0)
                    {
                        feelString = @"Meh";
                    }
                    else
                    {
                        if([feelingValue floatValue] < 5.0)
                        {
                            feelString = @"Good";
                        }
                        else //(>5.0);
                        {
                            feelString = @"Great!";
                        }
                    }
                }
            }
        }
    }

    self.displayFeel.text = feelString; 

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqual: @"Done"])
    {
        
        [self.theDay setDifferentDay:self.pickTime.date];
        [self.theDay setTemp:[[NSNumber alloc]initWithFloat:self.stepTemp.value]];
        [self.theDay setFeelingLevel:[[NSNumber alloc]initWithFloat:self.slideFeel.value]];
        
        if(self.coughCell.accessoryType == UITableViewCellAccessoryCheckmark)
        {
            [self.theDay setCough:YES];
        }
        else
        {
            [self.theDay setCough:NO];
        }
        
        if(self.acheCell.accessoryType == UITableViewCellAccessoryCheckmark)
        {
            [self.theDay setBodyAche:YES];
        }
        else
        {
            [self.theDay setBodyAche:NO];
        }
        
        if(self.fatigueCell.accessoryType == UITableViewCellAccessoryCheckmark)
        {
            [self.theDay setFatigue:YES];
        }
        else
        {
            [self.theDay setFatigue:NO];
        }
        
        
    }

}
@end
