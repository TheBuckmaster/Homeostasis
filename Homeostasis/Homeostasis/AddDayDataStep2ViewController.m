//
//  AddDayDataStep2ViewController.m
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 2/25/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import "AddDayDataStep2ViewController.h"
#import "DayData.h"
@interface AddDayDataStep2ViewController ()

@end

@implementation AddDayDataStep2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.feelingOutput setValue:[self.dayOfData.feelingLevel floatValue] animated:YES]; 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"addNewDayReturn"])
    {
        
        [self newFeelValue:self.feelingOutput.value];
        //Finally, on a segue, we'll return this data member to the Master View Controller.
        // e.g. self.dayOfData = something new. 
        //NSLog(@"Sending Data");
        
    }

}

- (void)newFeelValue:(float)f
{
    NSNumber *newF = [[NSNumber alloc]initWithFloat:f];
    [self.dayOfData setFeelingLevel:newF];
}


- (IBAction)feelValueChanged:(id)sender
{
    
    NSLog(@"slider value = %f",self.feelingOutput.value);
    [self newFeelValue:self.feelingOutput.value]; 
}
@end
