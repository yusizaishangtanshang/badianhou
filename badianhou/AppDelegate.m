//
//  AppDelegate.m
//  badianhou
//
//  Created by 贺东方 on 15/12/20.
//  Copyright © 2015年 hexiaoyi. All rights reserved.
//

#import "AppDelegate.h"
#import <MobClick.h>
#import <APService.h>
#import <UMSocial.h>
// 正式
//static NSString *const UMAnalyticsAppKey = @"555dcb0867e58e8b250038bc";
// 测试
static NSString *const UMAnalyticsAppKey = @"55c9fbb367e58e4df10003a9";

@interface AppDelegate ()
@property (nonatomic,assign) BOOL isReceive;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [application setStatusBarHidden:NO animated:UIStatusBarAnimationFade];
    self.window.backgroundColor = [UIColor whiteColor];
    [self prepareUmen];
    [APService setupWithOption:launchOptions];
    if (DeviceVersion >= 8.0) {
        [APService registerForRemoteNotificationTypes:UIUserNotificationTypeBadge |UIUserNotificationTypeSound |UIUserNotificationTypeAlert categories:nil];
    }
    else
    {
        [APService registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound categories:nil];
    }
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    [APService setBadge:0];
    [APService setupWithOption:launchOptions];
    NSDictionary *notification = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    if (notification) {
        self.isReceive = YES;
        self.isClickNotification = YES;
        if ([[notification valueForKey:@"contengType"]isEqualToString:@"CONSULTATION"]) {
            self.notificationCID = [notification valueForKey:@"bussinessId"];
        }
    }
    return YES;
}

- (void)prepareUmen{
    [UMSocialData ]
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
