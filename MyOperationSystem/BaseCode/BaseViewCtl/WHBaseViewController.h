//
//  WHBaseViewController.h
//  MyOperationSystem
//
//  Created by 浩哥哥 on 2017/6/14.
//  Copyright © 2017年 浩哥哥. All rights reserved.
//
typedef enum
{
    NAV_LEFT  = 0,
    NAV_RIGHT = 1,
}HGGNavigationBar;



#import <UIKit/UIKit.h>

@interface WHBaseViewController : UIViewController
/** navigation animation */
@property (nonatomic, assign) BOOL naviAnimating;

/** 设置导航栏的标题 */
- (void)setNavigationTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)font;

/** 设置文字按钮位置及相关信息 **/
- (void)showBarButton:(HGGNavigationBar)position title:(NSString *)title textColor:(UIColor *)color;

/** 设置图片按钮 **/
- (void)showBarButton:(HGGNavigationBar)position imageName:(NSString *)imageName;

/** 带文字的返回按钮 **/
- (void)showBackButtonWithTitle:(NSString *)title;

/** 左侧按钮的点击事件 **/
- (void)leftBtnAction:(id)sender;

/** 右侧按钮的点击事件 **/
- (void)rightBtnAction:(id)sender;



//小菊花的相关封装
/** 小菊花的显示 **/
- (void)showMBHud;

/** 带文字的小菊花的显示 **/
- (void)showMBHudWithText:(NSString *)text;

/** 带文字的小菊花并带存在时间 **/
- (void)showMBHudWithText:(NSString *)text existTime:(NSInteger)existTime;

/** 隐藏小菊花 **/
- (void)hideMBHud;

/** 默认的小菊花显示与存在时间 **/
- (void)showMBHubPromptDefulatTime:(NSString *)prompt;




@end
