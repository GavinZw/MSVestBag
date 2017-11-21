//
//  MSTransitionsViewController.m
//  MSVestBag
//
//  Created by Gavin on 17/11/17.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import <BmobSDK/Bmob.h>

#import "MSVestBagManage.h"
#import "MSTransitionsViewController.h"
#import "MSVestAppDelegate.h"
#import "MSWebViewController.h"
#import "MSVestBagConfigure.h"

//static NSString *const MSCacheUserDefaultKey = @"MSCacheUserDefaultKey";

NSString *const MSVestAppleIDKey        = @"appleid";
NSString *const MSVestShowWapKey        = @"allow_wap_page";
NSString *const MSVestWapURLKey         = @"wap_url";
NSString *const MSVestShowImageAlertKey = @"show_image_alert";
NSString *const MSVestImageAlertURLKey  = @"image_alert_url";
NSString *const MSVestAppStoreURLKey    = @"appStore_url";
NSString *const MSVestShowTabBarKey     = @"show_tabbar";

__weak static MSVestBagConfigure *_configure = nil;

@interface MSTransitionsViewController ()

@end

@implementation MSTransitionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
  _configure = MS_MANAGE->configures();
  [self.navigationController setNavigationBarHidden:YES animated:NO];
  
  // 设置启动图
  UIImageView *img = [[UIImageView alloc]initWithFrame:self.view.bounds];
  img.image = [UIImage imageNamed:_configure.launchScreenImageName];
  [self.view addSubview:img];
  
  NSArray *appLanguages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
  NSString *languageName = [appLanguages objectAtIndex:0];
  
  // 是在中文语言坏境
  if([languageName rangeOfString:@"zh"].location !=NSNotFound){[self reloadBmobQuery];}
  else{[self _pushShellRootViewController];} // 显示壳, 是在审核通过后,在非中文坏境下
}


/**
 push 到壳工程跟控制器
 */
- (void)_pushShellRootViewController{
//  MSVestAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
//  appDelegate.window.rootViewController = [_configure.shellRootViewController new];
}

- (void)_sendApplicationChangeInterfaceOrientationNotification:(id)anObject{
//  [self  presentViewController:[UIViewController new]
//                      animated:NO
//                    completion:^{
//                      [self dismissViewControllerAnimated:NO completion:nil];
//                    }];
  
   [[NSNotificationCenter defaultCenter] postNotificationName:kApplicationDidChangeInterfaceOrientationNotification object:anObject];
}
  
- (void)reloadBmobQuery{
   NSString *className = _configure.bmobClassName;
   className = (className.length >0)?className :@"onestop";
  
    __weak typeof(self) weakSelf = self;
   BmobQuery *query = [BmobQuery queryWithClassName:className];
  [query findObjectsInBackgroundWithBlock:^(NSArray <BmobObject *>*array, NSError *error)
  {
    __strong __typeof(self) strongSelf = weakSelf;
    if (error) {[strongSelf reloadBmobQuery];}  // 轮询
    else{ [strongSelf _bmobQueryRequestSuccessfulHandle:array];
    }
  }];
}

- (void)_bmobQueryRequestSuccessfulHandle:(NSArray <BmobObject *>*)objects{
  if (objects.count == 0) return;
  
  [objects enumerateObjectsUsingBlock:^(BmobObject * _Nonnull object, NSUInteger idx, BOOL * _Nonnull stop)
  {
  NSString *appleid = [object objectForKey:MSVestAppleIDKey];
  NSString *curAppleid = _configure.appleid;
    if ([appleid isEqualToString:curAppleid]) {
      NSString *showWapValue = [object objectForKey:MSVestShowWapKey];
      if ([showWapValue intValue] == 0) { // 显示wap
        [self createWebViewController:object];
      }
      else{ // 显示壳
         [self _pushShellRootViewController];
      }
      *stop = YES;
    }
  }];
}
  
- (void)createWebViewController:(BmobObject *)object{
  NSString *wapURL = [object objectForKey:MSVestWapURLKey];
  NSString *showImageAlert = [object objectForKey:MSVestShowImageAlertKey];
  NSString *showImageAlertURL = [object objectForKey:MSVestImageAlertURLKey];
  NSString *appStoreURL = [object objectForKey:MSVestAppStoreURLKey];
  NSString *showTabBar = [object objectForKey:MSVestShowTabBarKey];

  MSWebViewController *wap = [[MSWebViewController alloc]init];
  wap.wapURL = wapURL;
  wap.imgaeAlertURL = showImageAlertURL;
  wap.showImageAlert = showImageAlert;
  wap.appStoreURL = appStoreURL;
  wap.showTabBar = showTabBar;
  [self.navigationController pushViewController:wap animated:NO];
}
  
@end
