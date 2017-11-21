//
//  MSVestBagManage.m
//  MSVestBag
//
//  Created by Gavin on 17/11/17.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import "MSVestBagManage.h"
#import "MSVestBagConfigure.h"
#import "MSVestAppDelegate.h"

static MSVestBagManage_t *_manage_t = NULL;
static MSVestBagConfigure *_configure_static = NULL;

static MSVestBagConfigure *_configures(void){return _configure_static;}
static void _registeredVestBagManage(MSVestBagConfigure *configure){ _configure_static = configure;}

static NSString *_applicationMainDelegateClassName(void){
  return ([[NSDate date] timeIntervalSince1970] < _configure_static.endTimestamp)? _configure_static.curDelegateClassName : NSStringFromClass([MSVestAppDelegate class]);
}

@implementation MSVestBagManage

+ (MSVestBagManage_t *)shared{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manage_t = malloc(sizeof(MSVestBagManage_t));
        _manage_t->MSRegisteredVestBagManage = _registeredVestBagManage;
        _manage_t->MSApplicationMainDelegateClassName = _applicationMainDelegateClassName;
        _manage_t->configures = _configures;
    });
  
    return _manage_t;
}

@end
