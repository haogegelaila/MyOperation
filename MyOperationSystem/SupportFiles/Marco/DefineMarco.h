//
//  DefineMarco.h
//  MyOperationSystem
//
//  Created by 浩哥哥 on 2017/6/14.
//  Copyright © 2017年 浩哥哥. All rights reserved.
//

#ifndef DefineMarco_h
#define DefineMarco_h


//NSUserDefaults Shared
#define USER_DEFAULTS [NSUserDefaults standardUserDefaults]


#define kMyLog(...) NSLog(__VA_ARGS__)


/*****************通知中心***************/
#define ChangeTabBar        @"changeTabBar"
#define HideTabBar          @"hidden"
#define ShowTabBar          @"show"
#define DidChangeCity       @"didChangeCity"
#define kExchange           @"exchangeViewToFirst"





//设备的⾼高度
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height //设备的宽度
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width


//相关颜色
#define kWhiteColor     [UIColor whiteColor]
#define kDarkRed        [UIColor colorWithRed:0.92 green:0.32 blue:0.31 alpha:1.00] // 导航栏颜色
#define kBlue           [UIColor colorWithRed:0.01 green:0.54 blue:0.49 alpha:1.00]
#define kBlack          [UIColor blackColor]



#endif /* DefineMarco_h */
