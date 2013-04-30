//
//  PDataAddNewItemIntegratedViewController.h
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 4/26/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDataAddNewItemIntegratedViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIStepper *StepOutlet;
@property (weak, nonatomic) IBOutlet UISlider *sliderOutlet;
@property (weak, nonatomic) IBOutlet UIDatePicker *TimeOutlet;
@property (weak, nonatomic) IBOutlet UILabel *DisplayTemp;
@property (weak, nonatomic) IBOutlet UILabel *DisplayFeel;
- (IBAction)coughYes:(id)sender;
- (IBAction)acheYes:(id)sender;
- (IBAction)fatigueYes:(id)sender;
- (IBAction)coughNo:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *acheNo;
@property (weak, nonatomic) IBOutlet UIButton *fatigueNo;




@end
