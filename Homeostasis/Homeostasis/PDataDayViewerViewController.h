//
//  PDataDayViewerViewController.h
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 2/21/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DayData;
@interface PDataDayViewerViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *DateDetailOutlet;
@property (weak, nonatomic) IBOutlet UILabel *TimeDetailOutlet;
@property (weak, nonatomic) IBOutlet UITableViewCell *TempDetailOutlet;
@property (weak, nonatomic) IBOutlet UILabel *FeelDetailOutlet;
@property (weak, nonatomic) IBOutlet UILabel *CoughOutlet;
@property (weak, nonatomic) IBOutlet UILabel *BodyAcheOutlet;
@property (weak, nonatomic) IBOutlet UILabel *FatigueOutlet;

@property (strong, nonatomic) DayData *thatDay;

@end
