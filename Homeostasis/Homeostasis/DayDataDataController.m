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
    NSMutableArray *newList = [[NSMutableArray alloc] init];
    self.currentDataEntries = newList;
}

- (id)init {
    
    if (self = [super init])
    {
        [self initEmptyList];
        return self;
    }
    
    return nil;
}

- (void)setCurrentDataEntries:(NSMutableArray *)newList
{
    if(_currentDataEntries != newList)
    {
        _currentDataEntries = [newList mutableCopy];
    }
}

- (int)countOfList
{
    return _currentDataEntries.count;
}

- (DayData *)objectInListAtIndex:(NSUInteger)theIndex
{
    //self.lastIndex = theIndex;
    return [self.currentDataEntries objectAtIndex:theIndex];
}
- (void)addDayDataToList:(DayData *)thisDay
{
    //NSLog(@"%@", thisDay); //So we know it's getting a valid object.
    [self.currentDataEntries addObject:thisDay];
}

- (void)saveDataToDisk
{
    NSLog(@"LOL SAVED SOME DATAS LOL"); 
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // paths[0];
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"daysOfData.plist"];
    NSDictionary *dictToWrite = [[NSDictionary alloc] init];
    [dictToWrite dictionaryWithValuesForKeys:self.currentDataEntries];
    [dictToWrite writeToFile:plistPath atomically:YES];
    
}




@end
