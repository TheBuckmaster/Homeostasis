//
//  AddDayDataViewController.h
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 2/7/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddDayDataStep2ViewController.h"
@class DayData;
@interface AddDayDataViewController : UIViewController

//The Temp picker wheel.
@property (weak, nonatomic) IBOutlet UIPickerView *chosenTemp;

//A label for the date text field.
@property (weak, nonatomic) IBOutlet UILabel *label;

//Local variables for keeping correct values as different variables are changed. 
@property NSMutableArray *listOfWholeTemps;
@property NSMutableArray *listOfTenthTemps;
@property NSNumber *wholePart;
@property NSNumber *fractionalPart;
@property NSNumber *wholeAndPartTemp;

//A Local Date to coordinate with the next view if Today is not correct.
@property (strong, atomic) NSDate *theNewDay;

//-(IBAction)done:(UIStoryboardSegue*)sender;
-(IBAction)cancel:(UIStoryboardSegue*)sender;

//The "Return Value" object for the done: segue. 
@property (strong,atomic) DayData *dayOfData;

@end
