//
//  DayData.m
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 2/7/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import "DayData.h"

@implementation DayData
@synthesize theDay, todayTemp, salvaMe, feelingLevel, cough, bodyAche, fatigue;

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
    NSNumber *coughNumber = [[NSNumber alloc]initWithBool:cough];
    [encoder encodeObject:coughNumber forKey:@"cough"];
    NSNumber *acheNumber = [[NSNumber alloc]initWithBool:bodyAche];
    [encoder encodeObject:acheNumber forKey:@"ache"];
    NSNumber *fatNumber = [[NSNumber alloc]initWithBool:fatigue];
    [encoder encodeObject:fatNumber forKey:@"fatigue"];
}

- (id)initWithCoder:(NSCoder *)decoder{
    if (self = [super init]) {
        self.theDay = [decoder decodeObjectForKey:@"day"];
        self.todayTemp = [decoder decodeObjectForKey:@"temp"];
        self.feelingLevel = [decoder decodeObjectForKey:@"feel"];
        NSNumber *coughNumber = [decoder decodeObjectForKey:@"cough"];
        self.cough = [coughNumber boolValue];
        NSNumber *acheNumber = [decoder decodeObjectForKey:@"ache"];
        self.bodyAche = [acheNumber boolValue];
        NSNumber *fatNumber = [decoder decodeObjectForKey:@"fatigue"];
        self.fatigue = [fatNumber boolValue];
        
        [self saveThis];
    }
    return self; 
}

- (void)sayHasCough
{
    self.cough = YES;
}

- (void)sayHasNoCough
{
    self.cough = NO;
}

- (void)sayHasAche
{
    self.bodyAche = YES;
}

- (void)sayHasNoAche
{
    self.bodyAche = NO;
}

- (void)sayHasFatigue
{
    self.fatigue = YES;
}

- (void)sayHasNoFatigue
{
    self.fatigue = NO;
}

- (BOOL)hasCough
{
    return self.cough;
}

- (NSComparisonResult)compare:(DayData *)otherObject {
    return [self.theDay compare:otherObject.theDay];
}

@end
