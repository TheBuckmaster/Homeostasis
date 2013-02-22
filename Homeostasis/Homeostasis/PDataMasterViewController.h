//
//  PDataMasterViewController.h
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 2/7/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DayData;
@class DayDataDataController;
@interface PDataMasterViewController : UITableViewController
@property (strong, nonatomic) DayDataDataController *dataController;
@property (weak, nonatomic) IBOutlet UIButton *buttonTap;
- (IBAction)saveData:(id)sender;


- (IBAction)done:(UIStoryboardSegue *)segue;
- (IBAction)cancel:(UIStoryboardSegue *)segue;

@end
