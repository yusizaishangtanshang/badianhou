//
//  AppDelegate.h
//  badianhou
//
//  Created by 贺东方 on 15/12/20.
//  Copyright © 2015年 hexiaoyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (copy,nonatomic) NSString *chatConsultationId;
@property (copy,nonatomic) NSString *notificationCID;
@property (assign,nonatomic) BOOL isClickNotification;

@end

