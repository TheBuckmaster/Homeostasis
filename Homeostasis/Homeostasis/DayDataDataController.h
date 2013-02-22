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

//This is the index of the last array element accessed by calling
//objectInListAtIndex
@property NSUInteger lastIndex;

- (int)countOfList;
- (DayData *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)modifyObjectInListSaveState:(DayData *)dayChanged;
- (void)addDayDataToList:(DayData *)thisDay;
@end
