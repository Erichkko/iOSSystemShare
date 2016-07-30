//
//  ViewController.m
//  iOSSystemShare
//
//  Created by wanglong on 16/7/30.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //0.导入系统自带类
    
    //1.判断平台是否可用
    if (![SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        NSLog(@"facebook平台不可用...");
        return;
    }
    
    //2.创建分享的控制器
    SLComposeViewController *facebookVC  = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
        //2.1添加分享的文字
        [facebookVC setInitialText:@"哈哈哈"];
        //2.2t添加分享的图片
        [facebookVC addImage:[UIImage imageNamed:@"xingxing"]];
        //2.3添加分享的链接
        [facebookVC addURL:[NSURL URLWithString:@"www.google.com"]];
    
    //3.弹出控制器
    [self presentViewController:facebookVC animated:YES completion:nil];
    
    
    //4.监听用户的点击
    SLComposeViewControllerCompletionHandler handle = ^(SLComposeViewControllerResult result){
        if (result == SLComposeViewControllerResultDone) {
            NSLog(@"确认发送");
        }else{
            NSLog(@"取消发送");
        }
    };
    
    facebookVC.completionHandler = handle;
}
@end
