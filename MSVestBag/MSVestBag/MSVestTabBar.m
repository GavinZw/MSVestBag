//
//  MSVestTabBar.m
//  MSVestBag
//
//  Created by Gavin on 17/11/17.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import "MSVestTabBar.h"

@interface MSVestTabBar ()

@end

@implementation MSVestTabBar

-(instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundColor = [UIColor clearColor];
    self.userInteractionEnabled = YES;
    
    [self makeUI];
  }
  return self;
}

-(void)makeUI
{
  float width= self.frame.size.width;
  UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, self.frame.size.height)];
  view.backgroundColor = [UIColor whiteColor];
  [self addSubview:view];
  
  NSArray *array = @[@"首页",@"后退",@"前进",@"刷新",@"退出"];
  for (int i = 0; i < 5; i++) {
    UIButton *item;
    item = [UIButton buttonWithType:UIButtonTypeCustom];
    item.frame = CGRectMake(width/5.0*i, 0, width/5.0, 40);
    item.tag = i+50;
    
    switch (i) {
       case 0: self.Shouye  = item; break;
       case 1: self.Houtui  = item; break;
       case 2: self.Qianjin = item; break;
       case 3: self.Shuaxin = item; break;
       case 4: self.Tuichu  = item; break;
      default:
      break;
    }
    [view addSubview:item];
    
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(width/5.0*i+(width/5.0-30)/2.0, 3, 30, 30)];
    imageview.image = [self GetBundleImage:[NSString stringWithFormat:@"0_%d",i+1]];
    imageview.userInteractionEnabled = NO;
    [view addSubview:imageview];
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(width/5.0*i, 33, width/5.0, 15)];
    lable.text = array[i];
    lable.textColor = [UIColor blackColor];
    lable.font = [UIFont systemFontOfSize:14.0];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.userInteractionEnabled = NO;
    [view addSubview:lable];
  }
}
  
- (UIImage *)GetBundleImage:(NSString *)imageName{
  NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"vestimage" ofType:@"bundle"];
  return [UIImage imageWithContentsOfFile:[bundlePath stringByAppendingPathComponent:imageName]];
}

@end
