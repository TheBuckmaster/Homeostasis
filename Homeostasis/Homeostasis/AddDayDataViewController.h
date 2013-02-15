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

@property (weak, nonatomic) IBOutlet UIPickerView *chosenTemp;
//@property (weak, nonatomic) IBOutlet UIPickerView *chosenTempTenth;
@property NSMutableArray *listOfWholeTemps;
@property NSMutableArray *listOfTenthTemps;
@property NSNumber *wholeAndPartTemp;


@property (strong,atomic) DayData *dayOfData;

@end
