//
//  DayData.h
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 2/7/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DayData : NSObject

@property (nonatomic, strong) NSDate *theDay;
@property (nonatomic, strong) NSNumber *todayTemp;
@property BOOL *salvaMe;

-(BOOL*)getSaveState;
-(id)init;
-(void)setToday;
-(void)setDifferentDay:(NSDate *)thatDay;
-(void)setTemp:(NSNumber *)aTemp;
-(void)saveThis;
-(void)dontSaveThis;
-(void)flipSaveState;

@end
