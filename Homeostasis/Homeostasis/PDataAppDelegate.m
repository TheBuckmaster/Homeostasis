//
//  PDataAppDelegate.m
//  Homeostasis
//
//  Created by BENJAMIN BUCKMASTER on 2/7/13.
//  Copyright (c) 2013 BENJAMIN BUCKMASTER. All rights reserved.
//

#import "PDataAppDelegate.h"

@implementation PDataAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
 /*
    // Handle launching from a notification
    // This is called when the program is brought up from nothing.
    UILocalNotification *localNotif =     [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if (localNotif) {
        NSLog(@"Recieved Notification %@",localNotif);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wait" message:@"Are you sure you want to delete this.  This action cannot be undone" delegate:self cancelButtonTitle:@"Delete" otherButtonTitles:@"Cancel", nil];
        [alert show];
    }
    else
    {
        NSLog(@"Did not receive notification.");
    }
  */
    
    // Default code/behavior. 
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    /*
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    [notification setAlertBody:@"You need to add health data for today."];
    [notification setAlertAction:@"add now."];
    
    //[notification setFireDate:[NSDate dateWithTimeIntervalSinceNow:(right now - today at 8:00 AM) in seconds];
    //DEMO
    [notification setFireDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    [notification setTimeZone:[NSTimeZone defaultTimeZone]];
    [notification setSoundName:UILocalNotificationDefaultSoundName];
    
    if(notification == nil)
        NSLog(@"Is NIL"); 
    
    [application setScheduledLocalNotifications:[NSArray arrayWithObject:notification]];
    //[[UIApplication sharedApplication] presentLocalNotificationNow:notification];
    //[application setApplicationIconBadgeNumber:1];
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    
    NSLog(@"Received a Notification; %@", notification);
    
    
    //This is where an entry if the app is in the background or foreground is handled.

}

@end
