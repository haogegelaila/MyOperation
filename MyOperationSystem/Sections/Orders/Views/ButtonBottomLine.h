//
//  ButtonBottomLine.h
//  MyOperationSystem
//
//  Created by 浩哥哥 on 2017/6/16.
//  Copyright © 2017年 浩哥哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonBottomLine : UIButton

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIView *lineView;


- (instancetype)initWithFrame:(CGRect)frame WithTitle:(NSString *)title;
@end
