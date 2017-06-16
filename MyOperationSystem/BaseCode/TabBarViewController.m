//
//  TabBarViewController.m
//  MyOperationSystem
//
//  Created by 浩哥哥 on 2017/6/15.
//  Copyright © 2017年 浩哥哥. All rights reserved.
//

#import "TabBarViewController.h"
#import "MineFirstViewController.h"
#import "OrderFirstViewController.h"
#import "TerminalFirstViewController.h"
#import "HWNavigationController.h"


@interface TabBarViewController ()

@property (nonatomic, strong) OrderFirstViewController *orderVC;
@property (nonatomic, strong) TerminalFirstViewController *terminalVC;
@property (nonatomic, strong) MineFirstViewController *mineVC;

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creatTabbarInfo];
    
}

- (void)creatTabbarInfo{
    self.orderNav = [[HWNavigationController alloc]initWithRootViewController:self.orderVC];
    
    HWNavigationController *terminalNAV = [[HWNavigationController alloc]initWithRootViewController:self.terminalVC];
    HWNavigationController *mineNAV = [[HWNavigationController alloc]initWithRootViewController:self.mineVC];
    
    self.viewControllers = @[self.orderNav, terminalNAV, mineNAV];
    
    NSArray *arr = @[@"工单",@"终端",@"我的"];
    
    //创建底部的图片文字
    for (int i = 0; i < arr.count; i++) {
        UINavigationController *nav = self.viewControllers[i];
        UIImage *select = [UIImage imageNamed:[NSString stringWithFormat:@"tabBar_%d", i * 2 + 2]];
        UIImage *normal = [UIImage imageNamed:[NSString stringWithFormat:@"tabBar_%d", i * 2 + 1]];
        nav.tabBarItem.selectedImage = [select imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nav.tabBarItem.image = [normal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        nav.tabBarItem.title = arr[i];
        [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:kBlue, NSFontAttributeName: [UIFont systemFontOfSize:11.]} forState:UIControlStateSelected];
    }
    self.selectedIndex = 0;
    
    //add observer
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chageTheTabBar:) name:ChangeTabBar object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hidden) name:HideTabBar  object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showBar) name:ShowTabBar object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(exchangeViewToFirst) name:kExchange object:nil];
    
}

#pragma mark -- private Method 
- (void)exchangeViewToFirst{
    for (UINavigationController *targetNav in self.viewControllers) {
        if (targetNav.viewControllers.count > 1) {
            [targetNav popViewControllerAnimated:NO];
        }
    }
}

- (void)hidden{
    self.tabBar.hidden = YES;
}

- (void)showBar{
    self.tabBar.hidden = NO;
}

- (void)chageTheTabBar:(NSNotification *)notification{
    NSLog(@"改变啦");
}


#pragma mark -- lazy
- (OrderFirstViewController *)orderVC
{
    if (!_orderVC) {
        _orderVC = [[OrderFirstViewController alloc]init];
        _orderVC.title = @"工单";
    }
    return _orderVC;
}

- (TerminalFirstViewController *)terminalVC
{
    if (!_terminalVC) {
        _terminalVC = [[TerminalFirstViewController alloc]init];
        _terminalVC.title = @"终端";
    }
    return _terminalVC;
}

- (MineFirstViewController *)mineVC
{
    if (!_mineVC) {
        _mineVC = [[MineFirstViewController alloc]init];
        _mineVC.title = @"我的";
    }
    return _mineVC;
}












@end
