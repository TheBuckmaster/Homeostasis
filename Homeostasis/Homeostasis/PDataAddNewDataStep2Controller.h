//
//  PDataAddNewDataStep2Controller.h
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 3/13/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DayData;

@interface PDataAddNewDataStep2Controller : UITableViewController

@property (strong, atomic) DayData *theDay;
@property (weak, nonatomic) IBOutlet UISlider *feelingSlider;
- (IBAction)changedValue:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *yesButton;
@property (weak, nonatomic) IBOutlet UIButton *noButton;
@property bool hasCough;
- (IBAction)coughYes:(id)sender;
- (IBAction)coughNo:(id)sender;


@end
