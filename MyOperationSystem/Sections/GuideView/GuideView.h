//
//  GuideView.h
//  MyOperationSystem
//
//  Created by 浩哥哥 on 2017/6/14.
//  Copyright © 2017年 浩哥哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuideView : UIView <UIScrollViewDelegate>

@property (nonatomic, strong) UIPageControl *pageControl;

+(BOOL)isNeedShow;

@end
