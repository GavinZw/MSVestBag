//
//  MSVestAppDelegate+Configure.m
//  MSVestBag
//
//  Created by Gavin on 17/11/17.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import <BmobSDK/Bmob.h>
#import <JPush/JPUSHService.h>

#import "MSVestBagManage.h"
#import "MSVestBagConfigure.h"
#import "MSVestAppDelegate+Configure.h"

NSString *const kApplicationDidChangeInterfaceOrientationNotification = @"MS_ApplicationDidChangeInterfaceOrientationKey";

@implementation MSVestAppDelegate (Configure)

- (void)ms_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  MSVestBagConfigure *configure = [MSVestBagManage shared].configures;
  
  //Required
  //notice: 3.0.0及以后版本注册可以这样写，也可以继续用之前的注册方式
  JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
  entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
  [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
  [JPUSHService setupWithOption:launchOptions
                         appKey:configure.JPUSHServiceAppKey
                        channel:@"appstore"
               apsForProduction:YES
          advertisingIdentifier:nil];
  [Bmob registerWithAppKey:configure.BmobAppKey];
  
  
  [JPUSHService setBadge:0];//清空JPush服务器中存储的badge值
  [[UIApplication sharedApplication]setApplicationIconBadgeNumber:0];
  [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
  
  
  // oserver
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(appDidChangeInterfaceOrientationNotification:)
                                               name:kApplicationDidChangeInterfaceOrientationNotification
                                             object:nil];
}

- (void)appDidChangeInterfaceOrientationNotification:(NSNotification *)note{
  NSNumber *direction = note.object;  // YES表示portrait代表竖屏,NO表示landscape 是代表横屏.
  
  _curOrientationMask = direction.boolValue? UIInterfaceOrientationMaskPortrait :UIInterfaceOrientationMaskLandscapeRight;

  [self application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:_window];
}


@end
