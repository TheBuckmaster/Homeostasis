//
//  PDataAddNewItemIntegratedViewController.m
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 4/26/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import "PDataAddNewItemIntegratedViewController.h"

@interface PDataAddNewItemIntegratedViewController ()

@end

@implementation PDataAddNewItemIntegratedViewController

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
    
    //Initial value display.
    
    [self.sliderOutlet setValue:3.0 animated:YES];
    NSString *stringRepTempValue = [[NSString alloc]init];
    [stringRepTempValue stringByAppendingFormat:@"%f",self.StepOutlet.value]; 
    self.tempLabelOutlet.text = stringRepTempValue;
    
    self.TimeOutlet.datePickerMode = UIDatePickerModeDateAndTime;
    [self.TimeOutlet setDate:[[NSDate alloc]init] animated:YES];

    self.DisplayTemp.text = stringRepTempValue; 
    
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
    
    if(section == 0)
        return 5;
    else
        return 1;
}


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
}

- (IBAction)acheYes:(id)sender {
}

- (IBAction)fatigueYes:(id)sender {
}

- (IBAction)coughNo:(id)sender {
}
@end
