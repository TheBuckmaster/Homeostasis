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
    self.hasBodyAche = NO;
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
    return 3;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 2)
    {
        NSLog(@"Selected body ache cell.");
        if(self.hasBodyAche)
        {
            self.hasBodyAche = NO;
            self.bodyAcheCell.textLabel.text = @"You do not have body aches.";
            UIColor *textColor = [[UIColor alloc] init];
            textColor = [UIColor blueColor];
            self.bodyAcheCell.textLabel.textColor = textColor;
        }
        else
        {
            self.hasBodyAche = YES;
            self.bodyAcheCell.textLabel.text = @"You have body aches.";
            UIColor *textColor = [[UIColor alloc] init];
            textColor = [UIColor redColor];
            self.bodyAcheCell.textLabel.textColor = textColor;
        }
        [self.tableView reloadData];
    }
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
/*
- (IBAction)bodyAcheYes:(id)sender {
    self.hasBodyAche = YES;
}

- (IBAction)bodyAcheNo:(id)sender {
    self.hasBodyAche = NO; 
}
 */
@end
