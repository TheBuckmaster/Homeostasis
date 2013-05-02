//
//  PDataAddNewItemSuperIntegratedViewController.h
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 5/1/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DayData.h" 

@interface PDataAddNewItemSuperIntegratedViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIStepper *stepTemp;
@property (weak, nonatomic) IBOutlet UISlider *slideFeel;
@property (weak, nonatomic) IBOutlet UIDatePicker *pickTime;

- (IBAction)coughYes:(id)sender;
- (IBAction)acheYes:(id)sender;
- (IBAction)fatigueYes:(id)sender;
- (IBAction)fatigueNo:(id)sender;
- (IBAction)coughNo:(id)sender;
- (IBAction)acheNo:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *displayTemp;
@property (weak, nonatomic) IBOutlet UILabel *displayFeel;

- (IBAction)newTemp:(id)sender;
- (IBAction)newFeel:(id)sender;

@property (weak, nonatomic) IBOutlet UITableViewCell *coughCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *acheCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *fatigueCell;

@property (strong, atomic) DayData *theDay;

@end
