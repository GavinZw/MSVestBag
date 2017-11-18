//
//  MSWebViewController.h
//  MSVestBag
//
//  Created by Gavin on 17/11/17.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSWebViewController : UIViewController

@property (nonatomic ,copy) NSString *wapURL;           /* 加载WebView URL. */
@property (nonatomic ,copy) NSString *imgaeAlertURL;    /* Alert框图片 URL. */
@property (nonatomic ,copy) NSString *appStoreURL;      /* Alert框图片点击跳转苹果商URL. */
@property (nonatomic ,copy) NSString *showImageAlert;   /* 是否显示Alert框. 0表示显示, 非0表示不显示. */
@property (nonatomic ,copy) NSString *showTabBar;       /* 是否显示MSVestTabBar. 0表示显示, 非0表示不显示. */
  
@end
