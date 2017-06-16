//
//  HWNavigationController.m
//  MyOperationSystem
//
//  Created by 浩哥哥 on 2017/6/15.
//  Copyright © 2017年 浩哥哥. All rights reserved.
//

#import "HWNavigationController.h"
#import "WHBaseViewController.h"

@interface HWNavigationController ()

@end

@implementation HWNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self.viewControllers containsObject:viewController]) {
        NSLog(@"不允许push相同viewController");
        return;
    }
    
    if (![self.topViewController isMemberOfClass:[WHBaseViewController class]] || ![viewController isMemberOfClass:[WHBaseViewController class]]) {
        [super pushViewController:viewController animated:animated];
        return;
    }
    
    WHBaseViewController *baseObjc = (WHBaseViewController *)self.topViewController;
    if (baseObjc.naviAnimating) {
        NSLog(@"push动画进行中,不允许打断");
        return;
    }
    baseObjc.naviAnimating = YES;
    [viewController setValue:[NSNumber numberWithBool:YES] forKey:@"naviAnimating"];
    [super pushViewController:viewController animated:animated];
}



- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    if (![self.topViewController isMemberOfClass:[WHBaseViewController class]]) {
        return [super popViewControllerAnimated:animated];
    }
    WHBaseViewController *baseObj = (WHBaseViewController *)self.topViewController;
    if (baseObj.naviAnimating) {
        NSLog(@"pop动画进行中,不允许打断");
        return nil;
    }
    baseObj.naviAnimating = YES;
    return [super popViewControllerAnimated:animated];
}







@end
