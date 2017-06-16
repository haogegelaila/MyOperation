//
//  TopBtnView.m
//  MyOperationSystem
//
//  Created by 浩哥哥 on 2017/6/15.
//  Copyright © 2017年 浩哥哥. All rights reserved.
//

#import "TopBtnView.h"

@implementation TopBtnView

- (instancetype)initWithFrame:(CGRect)frame withArray:(NSArray *)array
{
    if (self = [super initWithFrame:frame]) {
        //创建按钮
        [self creatSubViewsWithArray:array withFrame:frame];
    }
    return self;
}

- (void)creatSubViewsWithArray:(NSArray *)array withFrame:(CGRect)frame{
    
    for (int i = 0; i < array.count; i++) {
        UIButton *btn = [[UIButton alloc]init];
        btn.tag = 500 + i;
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:kBlue forState:UIControlStateSelected];
        [btn setTitleColor:kBlack forState:UIControlStateNormal];
        btn.frame = CGRectMake(i * (frame.size.width / array.count), 64, frame.size.width/array.count, frame.size.height - 3);
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        //创建下面的那条线
        UIView *line = [[UIView alloc]init];
        line.tag = 600 + i;
        line.backgroundColor = kBlack;
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(btn.mas_bottom).offset(2);
            make.height.mas_equalTo(1);
            make.left.equalTo(btn.titleLabel);
            make.right.equalTo(btn.titleLabel);

        }];
    }
}


- (void)btnAction:(UIButton *)sender{
    //确定按钮是否选中
    NSLog(@"点击事件有效");
    NSArray *views = self.subviews;
    for (UIView *view in views) {
        if (sender.tag - 500 == view.tag - 600) {
            view.backgroundColor = kBlue;
        }else{
            view.backgroundColor = kBlack;
        }
    }
}









@end
