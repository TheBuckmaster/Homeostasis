//
//  AddDayDataViewController.m
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 2/7/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//
//  With respect to learning how to setup a pickerView, I am indebted to
//  Alec Morgana (Youtube.com/watch?v=1fcIAxmeWDQ). 
//


#import "AddDayDataViewController.h"
#import "ChooseDateViewController.h" 
#import "DayData.h"
@interface AddDayDataViewController ()

@end

@implementation AddDayDataViewController 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //Values for part of temp storage.
    _wholePart = [[NSNumber alloc] init];
    _fractionalPart = [[NSNumber alloc] init];
    
    //Set the date by default to today;
    
    if(!_theNewDay)
    {
        _theNewDay = [[NSDate alloc] init];
    }
    
    NSDateFormatter *myFormatter = [[NSDateFormatter alloc] init];
    myFormatter.dateStyle = NSDateFormatterShortStyle; 
    NSString *stringToShow = [[NSString alloc] init];
    stringToShow = [myFormatter stringFromDate:self.theNewDay];

    NSString *newestString = @"The date is: ";
    newestString = [newestString stringByAppendingString:stringToShow];

    _label.text = newestString;
    
    //@"This is a date label";
    
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



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //This is the identifier to return the newly created DayData object
    //back to the MasterViewController to display it. 
    if([[segue identifier] isEqualToString:@"addNewDayReturn"])
    {
        //In this block, we create and define a new DayData object to return. 
        DayData *brandNewDay;
        brandNewDay = [[DayData alloc] init];
        
        //Using the local variable (NSDate) _theNewDay, set the date to return.
        [brandNewDay setDifferentDay:self.theNewDay];
        //Using information passed from the TempPicker, we set the temp field. 
        [brandNewDay setTodayTemp:self.wholeAndPartTemp];
        
        //Finally, on a segue, we'll return this data member to the Master View Controller. 
        //NSLog(@"Sending Data");
        self.dayOfData = brandNewDay;
    }
    
    //This is the identifier to use a custom value for the date. 
    if ([[segue identifier] isEqualToString:@"pickADate"])
    {
        ChooseDateViewController *dateChooserView = [segue destinationViewController];
        NSLog(@"The Date that is being sent is %@",self.theNewDay); 
        //This is the scary line.
        //dateChooserView.ultimateChosenDate = self.theNewDay;
        //NSLog(@"Sanity Check");
    }
}

- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"returnNewDate"])  
    {
        ChooseDateViewController *chooseController = [segue sourceViewController];
        
        NSLog(@"DateReturned");
        NSLog(@"%@",chooseController.ultimateChosenDate); 
        
        self.theNewDay = chooseController.ultimateChosenDate;
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (IBAction)cancel:(UIStoryboardSegue *)sender
{
    if([[sender identifier] isEqualToString:@"noNewDate"])
    {
    [self dismissViewControllerAnimated:YES completion:NULL];

    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
