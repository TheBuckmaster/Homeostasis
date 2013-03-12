//
//  PDataAddNewItemViewController.h
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 3/12/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DayData;
@class ChooseDateViewController; 
@interface PDataAddNewItemViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITableViewCell *dateCell;
@property (weak, nonatomic) IBOutlet UIPickerView *chosenTemp;
@property (strong, atomic) DayData* theDay;

@property NSMutableArray *listOfWholeTemps;
@property NSMutableArray *listOfTenthTemps;
@property NSNumber *wholePart;
@property NSNumber *fractionalPart;
@property NSNumber *wholeAndPartTemp;

@end
