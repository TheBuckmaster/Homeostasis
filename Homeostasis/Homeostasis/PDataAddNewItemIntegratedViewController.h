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
@property (weak, nonatomic) IBOutlet UILabel *tempLabelOutlet;
@property (weak, nonatomic) IBOutlet UISlider *sliderOutlet;
@property (weak, nonatomic) IBOutlet UIButton *CoughYes;
@property (weak, nonatomic) IBOutlet UIButton *AcheYes;
@property (weak, nonatomic) IBOutlet UIButton *FatigueYes;
@property (weak, nonatomic) IBOutlet UIButton *CoughNo;
@property (weak, nonatomic) IBOutlet UIButton *AcheNo;
@property (weak, nonatomic) IBOutlet UIButton *FatigueNo;
@property (weak, nonatomic) IBOutlet UIDatePicker *TimeOutlet;

@end
