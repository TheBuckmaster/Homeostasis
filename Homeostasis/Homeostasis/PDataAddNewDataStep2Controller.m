//
//  PDataAddNewDataStep2Controller.m
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 3/13/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import "PDataAddNewDataStep2Controller.h"
#import "DayData.h"
@interface PDataAddNewDataStep2Controller ()

@end

@implementation PDataAddNewDataStep2Controller

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

    //NSLog(@"New View!");
    self.hasCough = NO; 
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
    return 2;
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"save"]) {
        if(self.hasCough)
            [self.theDay sayHasCough];
        else
            [self.theDay sayHasNoCough];
        
        self.theDay.feelingLevel = [[NSNumber alloc] initWithFloat:self.feelingSlider.value];
    }
    



}


- (IBAction)coughYes:(id)sender {
    self.hasCough = YES;
    
}

- (IBAction)coughNo:(id)sender {
    self.hasCough = NO;
}
- (IBAction)changedValue:(id)sender {
    //NSLog(@"Value = %f",self.feelingSlider.value);
}
@end
