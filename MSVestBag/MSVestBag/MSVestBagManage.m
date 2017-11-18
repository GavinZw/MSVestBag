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

#define kMSStar [[NSDate date] timeIntervalSince1970] > [MSVestBagManage shared].configures.endTimeInterval

@interface MSVestBagManage ()
  
@property (nonatomic, strong, readwrite) MSVestBagConfigure *configures;

@end

@implementation MSVestBagManage

+ (instancetype)shared{
  static MSVestBagManage *_shared = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _shared = [[self alloc] init];
  });
  
  return _shared;
}

+ (void)registeredVestBagManage:(MSVestBagConfigure *)configure{
  [MSVestBagManage shared].configures = configure;
}

+ (NSString *)MSApplicationMainDelegateClassName{
  return kMSStar? [MSVestBagManage shared].configures.curDelegateClassName : NSStringFromClass([MSVestAppDelegate class]);
}
  
@end
