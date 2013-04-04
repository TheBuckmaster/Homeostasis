//
//  DayDataDataController.h
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 2/7/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DayData;

@interface DayDataDataController : NSObject
@property (nonatomic,copy)NSMutableArray *currentDataEntries;

- (int)countOfList;
- (DayData *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addDayDataToList:(DayData *)thisDay;
- (void)saveDataToDisk;
- (void)loadDataFromDisk;
- (bool)dataForToday;



@end
