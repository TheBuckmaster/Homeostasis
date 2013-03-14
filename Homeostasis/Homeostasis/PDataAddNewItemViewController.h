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

@interface PDataAddNewItemViewController : UITableViewController <UIPickerViewDelegate, UIPickerViewDataSource>

//These are the local properties for manipulation of the cell and
//Temp. Picker Wheel. 
@property (weak, nonatomic) IBOutlet UITableViewCell *dateCell;
@property (weak, nonatomic) IBOutlet UIPickerView *chosenTemp;

//This is the parameter to be passed on, it serves as the skeleton to
//add to the main list. 
@property (strong, atomic) DayData* theDay;

//These are local properties for referencing the temp
//Options on the Picker Wheel and choosing a temp to return.
@property NSMutableArray *listOfWholeTemps;
@property NSMutableArray *listOfTenthTemps;
@property NSNumber *wholePart;
@property NSNumber *fractionalPart;
@property NSNumber *wholeAndPartTemp;

@end
