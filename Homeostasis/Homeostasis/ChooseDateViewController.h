//
//  ChooseDateViewController.h
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 2/18/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ChooseDateViewController : UIViewController

@property (strong, nonatomic) NSDate *ultimateChosenDate;

@property (weak, nonatomic) UIDatePicker *chooser;

@end
