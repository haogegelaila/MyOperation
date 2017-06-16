//
//  TopBtnView.h
//  MyOperationSystem
//
//  Created by 浩哥哥 on 2017/6/15.
//  Copyright © 2017年 浩哥哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonBottomLine.h"

@interface TopBtnView : UIView

@property (nonatomic, strong) ButtonBottomLine *button;

- (instancetype)initWithFrame:(CGRect)frame withArray:(NSArray *)array;

@end
