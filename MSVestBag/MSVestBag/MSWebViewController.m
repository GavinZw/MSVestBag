//
//  MSWebViewController.m
//  MSVestBag
//
//  Created by Gavin on 17/11/17.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import <WebKit/WebKit.h>
#import <SDWebImage/UIImageView+WebCache.h>

#import "MSWebViewController.h"
#import "MSVestTabBar.h"

#define MS_Exit exit(0)

@interface MSWebViewController () <
  WKUIDelegate,
  WKNavigationDelegate,
  UIAlertViewDelegate
>

@end

@implementation MSWebViewController {
  UIWebView *_webview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    [self reloadBmobQuery];
}

- (void)reloadBmobQuery
{
  BOOL isShowTabBar = [self.showTabBar intValue] == 0;
  CGFloat webView_H = self.view.frame.size.height;
  webView_H = isShowTabBar? (webView_H-50) :webView_H;
  
  _webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, webView_H)];
  [_webview setScalesPageToFit:YES];//自动缩放页面以适应屏幕
  NSURL *url = [[NSURL alloc]initWithString:self.wapURL];
  NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:20.0];
  [_webview loadRequest:req];
  [self.view addSubview:_webview];
  
  if (isShowTabBar) {
    MSVestTabBar *vestTabBar = [[MSVestTabBar alloc]initWithFrame:CGRectMake(0, webView_H, self.view.frame.size.width, 50)];
    [vestTabBar.Houtui addTarget:self action:@selector(webviewBack) forControlEvents:UIControlEventTouchUpInside];
    [vestTabBar.Shouye addTarget:self action:@selector(webviewMain) forControlEvents:UIControlEventTouchUpInside];
    [vestTabBar.Qianjin addTarget:self action:@selector(webviewForward) forControlEvents:UIControlEventTouchUpInside];
    [vestTabBar.Shuaxin addTarget:self action:@selector(webviewReload) forControlEvents:UIControlEventTouchUpInside];
    [vestTabBar.Tuichu addTarget:self action:@selector(webviewEsc) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:vestTabBar];
  }
  
  if ([self.showImageAlert intValue] == 0) { // 0 表示显示图片弹框
    UIImageView *im = [[UIImageView alloc]initWithFrame:self.view.bounds];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(toptip) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = im.bounds;
    [im addSubview:btn];
    im.hidden = YES;
    [self.view addSubview:im];
    
//    __weak typeof(self) weakSelf = self;
    [im sd_setImageWithURL:[NSURL URLWithString:self.imgaeAlertURL]
                 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
    {
//      __strong __typeof(self) strongSelf = weakSelf;
      dispatch_async(dispatch_get_main_queue(), ^{
        im.hidden = NO;
        im.userInteractionEnabled = YES;
      });
    }];
  }
}

#pragma makr - event
  
- (void)webviewBack{
  if (_webview.canGoBack) {
    [_webview goBack];
  }
}
  
- (void)webviewForward{
  [_webview goForward];
}
  
- (void)webviewReload{
  [_webview reload];
}
  
- (void)webviewEsc
{
  UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"是否退出？"
                                                 message:nil
                                                delegate:self
                                       cancelButtonTitle:@"取消"
                                       otherButtonTitles:@"确定", nil];
  [alert show];
}

- (void)toptip{
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.appStoreURL]];
}

- (void)webviewMain{
  NSURL *url = [[NSURL alloc]initWithString:self.wapURL];
  NSURLRequest *req = [NSURLRequest requestWithURL:url];
  [_webview loadRequest:req];
}

#pragma makr - UIAlertViewDelegate
  
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
  if (buttonIndex == 1) MS_Exit;
}

@end
