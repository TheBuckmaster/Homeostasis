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

//This is the record day of data to be added. 
@property (strong, atomic) DayData *theDay;

//Does the user have a cough? Defaults to NO.
@property bool hasCough;
//Does the user have body aches? Defaults to NO.
@property bool hasBodyAche;
//Does the user have noticable fatigue? Defaults to NO.
@property bool hasFatigue;

@property (weak, nonatomic) IBOutlet UITableViewCell *bodyAcheCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *coughCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *fatigueCell;

//The buttons and slider for reference.
@property (weak, nonatomic) IBOutlet UISlider *feelingSlider;
@property (weak, nonatomic) IBOutlet UIButton *coughYesButton;
@property (weak, nonatomic) IBOutlet UIButton *coughNoButton;

//The actions when users click a button or adjust the slider. 
- (IBAction)coughYes:(id)sender;
- (IBAction)coughNo:(id)sender;
- (IBAction)acheYes:(id)sender;
- (IBAction)acheNo:(id)sender;
- (IBAction)fatigueYes:(id)sender;
- (IBAction)fatigueNo:(id)sender;
- (IBAction)changedValue:(id)sender;
/*
- (IBAction)bodyAcheYes:(id)sender;
- (IBAction)bodyAcheNo:(id)sender;
*/

@end
