//
//  PDataAddNewItemViewController.m
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 3/12/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import "PDataAddNewItemViewController.h"
#import "DayData.h"
#import "ChooseDateViewController.h"
#import "PDataAddNewDataStep2Controller.h"

@interface PDataAddNewItemViewController()

@end

@implementation PDataAddNewItemViewController

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
    
    self.chosenTemp.dataSource = self;
    self.chosenTemp.delegate = self; 
    
    if(!self.theDay)
    {
        self.theDay = [[DayData alloc]init];
    }

    [self updateDate];
    
    //Values for part of temp storage.
    _wholePart = [[NSNumber alloc] init];
    _fractionalPart = [[NSNumber alloc] init];
    
    _listOfWholeTemps = [[NSMutableArray alloc] init];
    [_listOfWholeTemps addObject:@"95"];
    [_listOfWholeTemps addObject:@"96"];
    [_listOfWholeTemps addObject:@"97"];
    [_listOfWholeTemps addObject:@"98"];
    [_listOfWholeTemps addObject:@"99"];
    [_listOfWholeTemps addObject:@"100"];
    [_listOfWholeTemps addObject:@"101"];
    [_listOfWholeTemps addObject:@"102"];
    [_listOfWholeTemps addObject:@"103"];
    [_listOfWholeTemps addObject:@"104"];
    [_listOfWholeTemps addObject:@"105"];
    [_listOfWholeTemps addObject:@"106"];
    [_listOfWholeTemps addObject:@"107"];
    [_listOfWholeTemps addObject:@"108"];
    [_listOfWholeTemps addObject:@"109"];
    
    _listOfTenthTemps = [[NSMutableArray alloc] init];
    [_listOfTenthTemps addObject:@".0"];
    [_listOfTenthTemps addObject:@".1"];
    [_listOfTenthTemps addObject:@".2"];
    [_listOfTenthTemps addObject:@".3"];
    [_listOfTenthTemps addObject:@".4"];
    [_listOfTenthTemps addObject:@".5"];
    [_listOfTenthTemps addObject:@".6"];
    [_listOfTenthTemps addObject:@".7"];
    [_listOfTenthTemps addObject:@".8"];
    [_listOfTenthTemps addObject:@".9"];
    
    //Set both the pickerView and the combined output temp to 98.6 degrees.
    [_chosenTemp selectRow:3 inComponent:0 animated:YES]; //These will need to be double-checked
    [_chosenTemp selectRow:6 inComponent:1 animated:YES]; //If more options are added.
    _wholePart = [[NSNumber alloc]initWithInt:98];
    _fractionalPart = [[NSNumber alloc] initWithFloat:.6];
    _wholeAndPartTemp = [[NSNumber alloc] initWithFloat:
                         ([_wholePart intValue] +
                          [_fractionalPart floatValue])];
    

    
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
    return 1;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    //For The First Column
    if(component == 0)
        return [_listOfWholeTemps count];
    else
        //(component == 1)
        //For the Second Column
        return [_listOfTenthTemps count];
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    
    //For First Column
    if(component == 0)
        return [_listOfWholeTemps objectAtIndex:row];
    
    //For Second Column
    else//(component == 1)
        return [_listOfTenthTemps objectAtIndex:row];
}



- (void)pickerView:(UIPickerView*)chosenTemp didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    //NSLog(@"Selected an Item at");
    //NSLog(@"row: %d component: %d ",row,component);
    
    NSString *first;    //These are clarity strings.
    NSString *second;   //They made life much easier.
    
    
    if(component == 0)
    {
        first = [self.listOfWholeTemps objectAtIndex:row];
        self.wholePart = [[NSNumber alloc]initWithInt:[first intValue]];
        
    }
    if(component == 1)
    {
        second = [self.listOfTenthTemps objectAtIndex:row];
        self.fractionalPart = [[NSNumber alloc] initWithFloat:[second floatValue]];
        //NSLog(@"Fraction:%@",fractionalPart);
    }
    
    float newFloat = [self.wholePart intValue] + [self.fractionalPart floatValue];
    self.wholeAndPartTemp = [[NSNumber alloc] initWithFloat:newFloat];
    
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
    if ([[segue identifier] isEqualToString:@"nextStep"])
    {
        self.theDay.todayTemp = self.wholeAndPartTemp; 
        //NSLog(@"To the next Step!");
        PDataAddNewDataStep2Controller *newView = [segue destinationViewController];
        newView.theDay = self.theDay;
    }
    
    if ([[segue identifier] isEqualToString:@"pickTheDate"])
    {
        //NSLog(@"Pick the date!");
        ChooseDateViewController *dateView = (ChooseDateViewController*)((UINavigationController*)[segue destinationViewController]).topViewController;
        dateView.ultimateChosenDate = self.theDay.theDay; 
    }
}

- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"returnNewDate"])
    {
        ChooseDateViewController *chooseController = [segue sourceViewController];
        
        self.theDay.theDay = chooseController.ultimateChosenDate;
        [self dismissViewControllerAnimated:YES completion:NULL];
        
        //NSLog(@" %@ ", self.theDay.theDay);
        [self updateDate];
    }
    
    else
    {
        //AddDayDataStep2ViewController *add2Controller = [segue sourceViewController];
        //self.dayOfData = add2Controller.dayOfData;
    }

}

- (void)updateDate
{
    NSDateFormatter *theFormatter = [[NSDateFormatter alloc]init];
    [theFormatter setDateStyle:NSDateFormatterShortStyle];
    [theFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    self.dateCell.textLabel.text = [theFormatter stringFromDate:self.theDay.theDay];
}

- (IBAction)cancel:(UIStoryboardSegue *)sender
{
    if([[sender identifier] isEqualToString:@"noNewDate"])
    {
        [self dismissViewControllerAnimated:YES completion:NULL];
        
    }
}

@end
