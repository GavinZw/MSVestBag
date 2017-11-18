//
//  main.m
//  MSVestBagExample
//
//  Created by Gavin on 17/11/18.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ViewController.h"
#import "MSVestBag.h"

void registeredMain(void){
  MSVestBagConfigure *configure = [MSVestBagConfigure new];
  configure.BmobAppKey = @"ee877Application";
  configure.JPUSHServiceAppKey = @"ee877Application";
  configure.curDelegateClassName = NSStringFromClass([AppDelegate class]);
  configure.endTimeInterval = 153434134.99;
  configure.launchScreenImageName = @"launch.png";
  configure.appleid = @"1314258";
  configure.bmobClassName = @"onestop";
  
  [MSVestBagManage registeredVestBagManage:configure];
}


int main(int argc, char * argv[]) {
  @autoreleasepool {
    
      registeredMain();
      return UIApplicationMain(argc, argv, nil, [MSVestBagManage MSApplicationMainDelegateClassName]);
  }
}


