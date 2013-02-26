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


//This function will save all data marked for saving to file.
//In particular, it will be saved in DocumentsDirectory/daysOfData.plist"
- (void)saveDataToDisk
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:@"daysOfData.plist"];
    NSMutableArray *savingList = [[NSMutableArray alloc] init];
    
    for (DayData *d in self.currentDataEntries) {
        if(!(d.getSaveState == NO))
            [savingList addObject:d];
    }
    
    [NSKeyedArchiver archiveRootObject:savingList toFile:fullPath];
    
    
}

- (void)loadDataFromDisk
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fullpath = [documentsDirectory stringByAppendingPathComponent:@"daysOfData.plist"];
    NSMutableArray *arrayFromPath = [NSKeyedUnarchiver unarchiveObjectWithFile:fullpath];
    self.currentDataEntries = [[NSMutableArray alloc] initWithArray:arrayFromPath];
    NSLog(@"CDE has %d",self.countOfList); 
}




@end
