//
//  DayData.m
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 2/7/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import "DayData.h"

@implementation DayData
@synthesize theDay, todayTemp, salvaMe, feelingLevel; 

-(void)setTemp:(NSNumber *)aTemp
{
    todayTemp = aTemp;
}

-(BOOL*)getSaveState
{
    return salvaMe;
}

-(void)flipSaveState
{
    if(salvaMe == NO)
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
    theDay = [NSDate date];
}

-(void)setDifferentDay:(NSDate *)thatDay
{
    theDay = thatDay;
}

-(void)setFeelingLevel:(NSNumber *)level
{
    feelingLevel = [[NSNumber alloc] initWithFloat:[level floatValue]];
}

-(id)init
{
    self = [super init];
    
    if (self)
    {
        [self setToday];
        [self dontSaveThis];
        [self setFeelingLevel:[[NSNumber alloc]initWithFloat:3.0]];
        return self;
    }
    
    return nil;
    
}

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:theDay forKey:@"day"];
    [encoder encodeObject:todayTemp forKey:@"temp"];
    [encoder encodeObject:feelingLevel forKey:@"feel"];
}

- (id)initWithCoder:(NSCoder *)decoder{
    if (self = [super init]) {
        self.theDay = [decoder decodeObjectForKey:@"day"];
        self.todayTemp = [decoder decodeObjectForKey:@"temp"];
        self.feelingLevel = [decoder decodeObjectForKey:@"feel"]; 
        [self saveThis];
    }
    return self; 
}


@end
