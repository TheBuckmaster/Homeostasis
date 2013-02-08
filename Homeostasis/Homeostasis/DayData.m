//
//  DayData.m
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 2/7/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import "DayData.h"

@implementation DayData

-(void)setTemp:(NSNumber *)aTemp
{
    _todayTemp = aTemp;
}

-(void)setToday
{
    _theDay = [NSDate date];

}

-(void)setDifferentDay:(NSDate *)thatDay
{
    _theDay = thatDay;
}

-(id)init
{
    self = [super init];
    
    if (self)
    {
        [self setToday];
        return self;
    }
    
    return nil;
    
    
}

@end
