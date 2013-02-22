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

-(BOOL*)getSaveState
{
    return self.salvaMe;
}

-(void)flipSaveState
{
    if(self.salvaMe == NO)
        [self saveThis];
    else
        [self dontSaveThis];

}

-(void)saveThis
{
    self.salvaMe = (BOOL*)TRUE;
    //self.salvaMe = TRUE;
    //self.salvaMe = true;
    //self.salvaMe = YES;
}

- (void)dontSaveThis
{
    self.salvaMe = (BOOL*)FALSE;
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
        [self dontSaveThis]; 
        return self;
    }
    
    return nil;
    
    
}

@end
