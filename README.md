# MSVestBag 
MSVestBag Modules

## install
pod 'MSVestBag', :git => 'https://github.com/GavinZw/MSVestBag.git', :tag => '1.0.0'


## example
    //
    //  main.m
    //  MSVestExample
    //
    //  Created by Gavin on 17/11/18.
    //  Copyright © 2017年 Gavin. All rights reserved.
    //

    #import <UIKit/UIKit.h>
    #import "AppDelegate.h"
    #import "MSVestBag.h"

    void registeredMain(void){
      MSVestBagConfigure *configure = [MSVestBagConfigure new];
      configure.BmobAppKey = @"a1658ab0e240583b13235b1e361f4bdc";
      configure.JPUSHServiceAppKey = @"2277861fef5f3442c8c4ed91";
      configure.curDelegateClassName = NSStringFromClass([AppDelegate class]);
      configure.endTimeInterval = 153434134.99;
      configure.launchScreenImageName = @"launch.png";
      configure.appleid = @"1292512095";
      configure.bmobClassName = @"onestop";

      [MSVestBagManage registeredVestBagManage:configure];
    }


    int main(int argc, char * argv[]) {
      @autoreleasepool {

        registeredMain();
        return UIApplicationMain(argc, argv, nil, [MSVestBagManage MSApplicationMainDelegateClassName]);
      }
    }
