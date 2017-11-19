//
//  MSVestBagConfigure.h
//  MSVestBag
//
//  Created by Gavin on 17/11/18.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 TODO: 关于Bmob后台数据配置结构
   {
     show_tabbar    : "0"             是否显示wap页面TabBar
     appleid:"1292512093",            当前应用Apple ID
     allow_wap_page: "0",             0表示显示wap,非0展示壳工程
     wap_url       : "www.xxx.com",   当前展示wap的网页地址
     show_image_alert : "0",          0表示显示图片弹框,非0不显示
     image_alert_url  : "www.xxx.com",当前图片弹框的图片的网页地址
     appStore_url    : "appleid",     应用在苹果商店的appleid
   }
 */
@interface MSVestBagConfigure : NSObject

///----------------------------------------------------
/// @name SDK注册相关
///----------------------------------------------------
  
@property (nonatomic, copy) NSString *BmobAppKey;  /*在Bmob注册的appkey. */
@property (nonatomic, copy) NSString *JPUSHServiceAppKey; /*appKey 一个JPush 应用必须的,唯一的标识. 请参考 JPush 相关说明文档来获取这个标识.*/
  
///----------------------------------------------------
/// @name 配置当前相关参数
///----------------------------------------------------
  
@property (nonatomic, strong) NSString *curDelegateClassName; /* 当前壳空工程的入口名称,默认:AppDelegate*/
@property (nonatomic) NSTimeInterval endTimeInterval;   /* 审核截至时间, 附上时间转换地址:https://unixtime.51240.com/ */

@property (nonatomic, copy) NSString *launchScreenImageName;  /*当前使用壳工程的启动图片name .*/

@property (nonatomic, copy) NSString *appleid;       /* 当前应用对于苹果商店包的Apple ID. TODO:请保持设置的appleid 与Bmob一样.*/
@property (nonatomic, copy) NSString *bmobClassName; /*对象名称（数据库表名可选的, Default: onestop */
  
@end
