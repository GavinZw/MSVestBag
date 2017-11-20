//
//  MSVestBag.h
//  MSVestBag
//
//  Created by Gavin on 17/11/17.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<MSVestBag/MSVestBag.h>)
FOUNDATION_EXPORT double MSVestBagVersionNumber;
FOUNDATION_EXPORT const unsigned char MSVestBagVersionString[];
#import <MSVestBag/MSVestBagManage.h>
#import <MSVestBag/MSVestBagConfigure.h>
#import <MSVestBag/MSVestTabBar.h>
#import <MSVestBag/MSVestAppDelegate.h>
#import <MSVestBag/MSWebViewController.h>
#import <MSVestBag/MSVestAppDelegate+Configure.h>
#import <MSVestBag/MSTransitionsViewController.h>
#else
#import "MSVestBagManage.h"
#import "MSVestBagConfigure.h"
#import "MSVestTabBar.h"
#import "MSVestAppDelegate.h"
#import "MSWebViewController.h"
#import "MSVestAppDelegate+Configure.h"
#import "MSTransitionsViewController.h"
#endif


