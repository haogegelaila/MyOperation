//
//  GuideView.m
//  MyOperationSystem
//
//  Created by 浩哥哥 on 2017/6/14.
//  Copyright © 2017年 浩哥哥. All rights reserved.
//

#import "GuideView.h"

#define kVersionName    @"version_name"

@implementation GuideView
+ (BOOL)isNeedShow
{
    NSString *appVersion = [[[NSBundle mainBundle]infoDictionary]objectForKey:@"CFBundleShortVersionString"];
    
    NSString *storeVersion = [USER_DEFAULTS objectForKey:kVersionName];
    return ![storeVersion isEqualToString:appVersion];
}

//初始化导航页面
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView:frame];
    }
    return self;
}




//创建界面
- (void)initView:(CGRect )frame
{
    //创建 scrollview
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:frame];
    scrollView.bounces = NO;
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(ScreenWidth * 4, ScreenHeight);
    scrollView.pagingEnabled = YES;
    
    //创建四张启动图片
    for (int i=0; i<4; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*ScreenWidth, 0, ScreenWidth, ScreenHeight)];
        [scrollView addSubview:imageView];
        if (i == 3) {
            imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide_%d.png", 1]];
        } else {
            imageView.contentMode = UIViewContentModeScaleToFill;
            imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide_%d.png", i+1]];
        }
        if (i == 2) {
            imageView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
            [imageView addGestureRecognizer:tap];
            UIButton* start = [UIButton buttonWithType:UIButtonTypeCustom];
            start.frame = CGRectMake(0, 0, 200, 80);
            // [start setImage:[UIImage imageNamed:@"startApp"] forState:UIControlStateNormal];
            [start setCenter:CGPointMake(i*ScreenWidth+ScreenWidth/2, ScreenHeight - 60)];
            [start addTarget:self action:@selector(closeView) forControlEvents:UIControlEventTouchUpInside];
            [scrollView addSubview:start];
        }
    }
    [self addSubview:scrollView];
    
}

- (void)tapAction{
    [self closeView];
    
}

- (void)closeView{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
        [self removeFromSuperview];
        //保存版本信息
        [self saveVersion];
    }completion:nil];
}

- (void)saveVersion{
    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleShortVersionString"];
    [USER_DEFAULTS setObject:appVersion forKey:kVersionName];
}




#pragma mark -- UIScrollViewDelegate
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x/ScreenWidth > 2) {
        [self closeView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int currentPage = scrollView.contentOffset.x / ScreenWidth;
    _pageControl.currentPage = currentPage;
}



#pragma mark -- lazy 
- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(ScreenWidth/2 - 30, ScreenHeight - 30, 60, 20)];
        _pageControl.pageIndicatorTintColor = kWhiteColor;
        _pageControl.currentPageIndicatorTintColor = kDarkRed;
        _pageControl.numberOfPages = 3;
    }
    return _pageControl;
}







@end
