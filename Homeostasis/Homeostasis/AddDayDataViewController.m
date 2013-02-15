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
    
    NSLog(@"Selected an Item at");
    NSLog(@"row: %d component: %d ",row,component);
    NSString *first = [self.listOfWholeTemps objectAtIndex:row];
    NSString *second = [self.listOfTenthTemps objectAtIndex:row];
    NSNumber *wholePart;
    NSNumber *fractionalPart;
    
    if(component == 0){
        wholePart = [[NSNumber alloc]initWithInt:[first intValue]];
        //NSLog(@"Whole:%@",wholePart);
    }
    else
    {
        fractionalPart = [[NSNumber alloc] initWithFloat:[second floatValue]];
        //NSLog(@"Fraction:%@",fractionalPart);
    }
    
    float newFloat = [wholePart intValue] + [fractionalPart floatValue];
    NSLog(@"NF: %f",newFloat); 
    
    self.wholeAndPartTemp = [_wholeAndPartTemp initWithFloat:newFloat];
    
    NSLog(@"Combined Temp : %f",self.wholeAndPartTemp.floatValue);
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _wholeAndPartTemp = [[NSNumber alloc] init];
    
    _listOfWholeTemps = [[NSMutableArray alloc] init];
    [_listOfWholeTemps addObject:@"95"];
    [_listOfWholeTemps addObject:@"96"];
    [_listOfWholeTemps addObject:@"97"];
    [_listOfWholeTemps addObject:@"98"];
    [_listOfWholeTemps addObject:@"99"];
    [_listOfWholeTemps addObject:@"100"];
    [_listOfWholeTemps addObject:@"101"];
    [_listOfWholeTemps addObject:@"102"];
    
    
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
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"addNewDayReturn"])
    {
        DayData *newDay;
        newDay = [[DayData alloc] init];
        [newDay setToday];
        //Also set today's Temp. For now we'll just do 98.6.
        NSNumber *currTemp = [[NSNumber alloc] initWithFloat:98.6];
        //currTemp = [currTemp initWithDouble:98.6];
        NSLog(@"Temp : %@",currTemp);
        [newDay setTodayTemp:currTemp];
        NSLog(@"Sending Data");
        self.dayOfData = newDay;     
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
