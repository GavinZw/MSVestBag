//
//  MSVestAppDelegate.h
//  MSVestBag
//
//  Created by Gavin on 17/11/17.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JPush/JPUSHService.h>

// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

UIKIT_EXTERN NSString* const kApplicationDidChangeInterfaceOrientationNotification;

@interface MSVestAppDelegate : UIResponder <
   UIApplicationDelegate,
   JPUSHRegisterDelegate,
   UNUserNotificationCenterDelegate
>
{
  UIWindow*           _window;
  UIViewController*   _rootController;
  
  UIInterfaceOrientationMask  _curOrientationMask;
}

@property (nonatomic, readonly) UIInterfaceOrientationMask interfaceOrientationMask;

@property (nonatomic, strong) UIWindow *window;
  
  
  

@end
