//
//  ChooseDateViewController.m
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 2/18/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import "ChooseDateViewController.h"

@interface ChooseDateViewController ()

@end

@implementation ChooseDateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //_chooser = [[UIDatePicker alloc] init];
    
	// Do any additional setup after loading the view.
    
    //NSLog(@"%@",self.ultimateChosenDate);
    self.chooser.datePickerMode = UIDatePickerModeDateAndTime;
    [self.chooser setDate:self.ultimateChosenDate animated:YES];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([[segue identifier] isEqualToString:@"returnNewDate"])
  {
      self.ultimateChosenDate = self.chooser.date;
  }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
