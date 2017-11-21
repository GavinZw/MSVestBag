# MSVestBag 
MSVestBag Modules

## install
pod 'MSVestBag', :git => 'https://github.com/GavinZw/MSVestBag.git', :tag => '1.0.6'


## example
    //
    //  main.m
    //  MSVestExample
    //
    //  Created by Gavin on 17/11/18.
    //  Copyright © 2017年 Gavin. All rights reserved.
    //

    #import <UIKit/UIKit.h>
    #import <MSVestBag/MSVestBag.h>
    #import "AppDelegate.h"    

    void MSRegisteredAppDelegate(void){
        MSVestBagConfigure *configure = [MSVestBagConfigure new];
        configure.bmobClassName = @"onestop";
        configure.BmobAppKey = @"a1658ab0e240583b13235b1e361f4bdc";
        configure.JPUSHServiceAppKey = @"2277861fef5f3442c8c4ed91";
        configure.appleid = @"1292512095";
  
        configure.endTimeInterval = 153434134.99;
        configure.launchScreenImageName = @"launchScreen.png";
        configure.curDelegateClassName = NSStringFromClass([AppDelegate class]);
  
       MS_MANAGE->MSRegisteredVestBagManage(configure);
    }


    int main(int argc, char * argv[]) {
      @autoreleasepool {

        MSRegisteredAppDelegate(); // registered        
        return UIApplicationMain(argc, argv, nil, MS_MANAGE->MSApplicationMainDelegateClassName());
      }
    }


## 最后更新日期
2017.11.21
