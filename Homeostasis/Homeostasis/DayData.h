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
@property BOOL cough;
@property (nonatomic, strong) NSNumber  *feelingLevel;


-(BOOL*)getSaveState;
-(id)init;
-(void)setFeelingLevel:(NSNumber *)level;
-(void)setToday;
-(void)setDifferentDay:(NSDate *)thatDay;
-(void)setTemp:(NSNumber *)aTemp;
-(void)saveThis;
-(void)dontSaveThis;
-(void)flipSaveState;
-(void)sayHasCough;
-(void)sayHasNoCough;
-(BOOL)hasCough;


@end
