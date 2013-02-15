//
//  AddDayDataViewController.h
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 2/7/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DayData;
@interface AddDayDataViewController : UIViewController

//The date picker and picker wheels. 
@property (weak, nonatomic) IBOutlet UIDatePicker *chosenDay;
@property (weak, nonatomic) IBOutlet UIPickerView *chosenTemp;

//Local variables for keeping correct values as different variables are changed. 
@property NSMutableArray *listOfWholeTemps;
@property NSMutableArray *listOfTenthTemps;
@property NSNumber *wholePart;
@property NSNumber *fractionalPart;
@property NSNumber *wholeAndPartTemp;

//The "Return Value" object for the done: segue. 
@property (strong,atomic) DayData *dayOfData;

@end
