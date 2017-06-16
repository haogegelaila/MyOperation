//
//  ButtonBottomLine.m
//  MyOperationSystem
//
//  Created by 浩哥哥 on 2017/6/16.
//  Copyright © 2017年 浩哥哥. All rights reserved.
//

#import "ButtonBottomLine.h"

@implementation ButtonBottomLine

- (instancetype)initWithFrame:(CGRect)frame WithTitle:(NSString *)title
{
    if (self = [super initWithFrame:frame]) {
        //创建按钮
        [self creatSubViewsWithFrame:frame withTitle:title];
    }
    return self;
}

- (void)creatSubViewsWithFrame:(CGRect)frame withTitle:(NSString *)title{
    _button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - 5)];
    [_button setTitle:title forState:UIControlStateNormal];
    [_button setTitleColor:kBlack forState:UIControlStateNormal];
    [self addSubview:_button];
    
    _lineView = [[UIView alloc]initWithFrame:CGRectMake(_button.frame.origin.x, frame.size.height - 4, _button.titleLabel.frame.size.width, 0.5)];
    _lineView.backgroundColor = kBlack;
    [self addSubview:_lineView];
    
}





@end
