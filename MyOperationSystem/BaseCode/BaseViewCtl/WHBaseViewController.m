//
//  WHBaseViewController.m
//  MyOperationSystem
//
//  Created by 浩哥哥 on 2017/6/14.
//  Copyright © 2017年 浩哥哥. All rights reserved.
//
#define hubTag 8088


#import "WHBaseViewController.h"
#import "UIButton+HGGExtend.h"
#import "MBProgressHUD.h"
@interface WHBaseViewController ()

@end

@implementation WHBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/** 设置导航栏的标题 */
- (void)setNavigationTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)font
{
    UILabel *label = [[UILabel alloc]init];
    label.text = title;
    label.frame = CGRectZero;
    label.textColor = titleColor;
    
    self.navigationItem.titleView = label;
    [label sizeToFit];
    
    label.textAlignment = NSTextAlignmentCenter;
}

/** 设置文字按钮位置及相关信息 **/
- (void)showBarButton:(HGGNavigationBar)position title:(NSString *)title textColor:(UIColor *)color
{
    UIButton *button = [[UIButton alloc]initNavigationWithTitle:title color:color];
    [self showBarButtonWithPosition:position button:button];
}

/** 设置图片按钮 **/
- (void)showBarButton:(HGGNavigationBar)position imageName:(NSString *)imageName
{
    UIButton *button = [[UIButton alloc]initNavigationButton:[UIImage imageNamed:imageName]];
    [self showBarButtonWithPosition:position button:button];
    
    
}

/** 带文字的返回按钮 **/
- (void)showBackButtonWithTitle:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 80, 44);
    [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -50, 0, 0)];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -50, 0, 0)];
    [self showBarButtonWithPosition:NAV_LEFT button:button];
}

/** 左侧按钮的点击事件 **/
- (void)leftBtnAction:(id)sender
{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

/** 右侧按钮的点击事件 **/
- (void)rightBtnAction:(id)sender
{
    NSLog(@"right btn response deafult");

}



//小菊花的相关封装
/** 小菊花的显示 **/
- (void)showMBHud
{
    if ([self.view viewWithTag:hubTag]) {
        return;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *progress = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        progress.tag = hubTag;
    });
}

/** 带文字的小菊花的显示 **/
- (void)showMBHudWithText:(NSString *)text
{
    if ([self.view viewWithTag:hubTag]) {
        return;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *progress = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        progress.tag  = hubTag;
        progress.label.text = text;
    });
}

/** 带文字的小菊花并带存在时间 **/
- (void)showMBHudWithText:(NSString *)text existTime:(NSInteger)existTime
{
    if ([self.view viewWithTag:hubTag]) {
        [self  hideMBHud];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *progress = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        progress.mode = MBProgressHUDModeText;
        progress.opacity = 1;
        progress.label.font = [UIFont systemFontOfSize:13];
        progress.label.text = text;
        [progress hideAnimated:YES afterDelay:existTime];
    });
}

/** 隐藏小菊花 **/
- (void)hideMBHud
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)showMBHubPromptDefulatTime:(NSString *)prompt
{
    [self showMBHudWithText: prompt existTime:1];
}





#pragma mark -- private Method
- (void)showBarButtonWithPosition:(HGGNavigationBar)position button:(UIButton *)button
{
    if (NAV_LEFT == position) {
        [button addTarget:self action:@selector(leftBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }else if (NAV_RIGHT == position){
        [button addTarget:self action:@selector(rightBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = nil;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
        
    }
}







@end
