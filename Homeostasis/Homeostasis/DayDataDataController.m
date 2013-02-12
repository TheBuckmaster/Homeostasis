//
//  DayDataDataController.m
//  Homeostasis
//
//  This is the implementation for the Data Controller for DayData objects
//  used by the Homeostasis app. Its core functionality is based on the
//  style demonstrated in the BirdWatching ("Your second iOS app") tutorial.
//  For more information:
//  https://developer.apple.com/library/ios/#documentation/iPhone/Conceptual/SecondiOSAppTutorial/DesigningDataModel/DesigningDataModel.html#//apple_ref/doc/uid/TP40011318-CH3-SW2
//
//  Created by BENJAMIN BUCKMASTER on 2/7/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import "DayDataDataController.h"
#import "DayData.h"

@interface DayDataDataController ()
-(void)initEmptyList;
@end

@implementation DayDataDataController

- (void)initEmptyList
{
    self.currentDataEntries = [[NSMutableArray alloc] init];
}

- (id)init {
    
    if (self = [super init])
    {
        [self initEmptyList];
        return self;
    }
    
    return nil;
}

- (int)countOfList
{
    return _currentDataEntries.count;
}

- (DayData *)objectInListAtIndex:(NSUInteger)theIndex
{

    return [self.currentDataEntries objectAtIndex:theIndex];

}
- (void)addDayDataToList:(DayData *)thisDay
{
    [self.currentDataEntries addObject:thisDay];
}


@end
