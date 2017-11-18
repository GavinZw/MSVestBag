//
//  MSVestBagManage.h
//  MSVestBag
//
//  Created by Gavin on 17/11/17.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MSVestBagConfigure;

@interface MSVestBagManage : NSObject 

+ (instancetype)shared;

/** 使用注册方法使用当前的包. */
+ (void)registeredVestBagManage:(MSVestBagConfigure *)configure;
+ (NSString *)MSApplicationMainDelegateClassName;  /** 获取工程入口. */
  
@property (nonatomic, strong, readonly) MSVestBagConfigure *configures;
  
@end
