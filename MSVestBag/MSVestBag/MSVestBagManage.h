//
//  MSVestBagManage.h
//  MSVestBag
//
//  Created by Gavin on 17/11/17.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MSVestBagConfigure;

typedef struct _VestBagManage{
 void (*MSRegisteredVestBagManage)(MSVestBagConfigure *configure);   /** 使用注册方法使用当前的包. */
 NSString *(*MSApplicationMainDelegateClassName)(void); /** 获取工程入口. */
 
  MSVestBagConfigure *(*configures)(void);
}MSVestBagManage_t;

#define MS_MANAGE ([MSVestBagManage shared])

@interface MSVestBagManage : NSObject 

+ (MSVestBagManage_t *)shared;

@end
