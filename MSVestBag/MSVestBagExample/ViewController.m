//
//  ViewController.m
//  MSVestBagExample
//
//  Created by Gavin on 17/11/18.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  UILabel *shell = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 100)]
  ;
  shell.backgroundColor = [UIColor blackColor];
  shell.center = self.view.center;
  shell.textColor = [UIColor whiteColor];
  shell.textAlignment = NSTextAlignmentCenter;
  shell.text = @"我是一个壳";
  [self.view addSubview: shell];
  self.view.backgroundColor = [UIColor whiteColor];
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
