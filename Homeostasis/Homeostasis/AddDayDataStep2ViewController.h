//
//  AddDayDataStep2ViewController.h
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 2/25/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DayData; 
@interface AddDayDataStep2ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UISegmentedControl *CoughOutlet;
@property (weak, nonatomic) IBOutlet UISlider *feelingOutput;

- (IBAction)feelValueChanged:(id)sender;

//The "Return Value" object for the done: segue.
@property (strong,atomic) DayData *dayOfData;

@end
