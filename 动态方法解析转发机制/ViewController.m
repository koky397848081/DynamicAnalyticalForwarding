//
//  ViewController.m
//  动态方法解析转发机制
//
//  Created by xujing on 16/11/4.
//  Copyright © 2016年 xujing. All rights reserved.
//

#import "ViewController.h"
#import "EOCAutoDictionary.h" //动态方法解析实现@dynamic属性

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    EOCAutoDictionary *dict = [EOCAutoDictionary new];
    dict.date = [NSDate dateWithTimeIntervalSince1970:475372800];
    NSLog(@"dict.date = %@",dict.date);
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
