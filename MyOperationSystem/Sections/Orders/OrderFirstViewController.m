//
//  OrderFirstViewController.m
//  MyOperationSystem
//
//  Created by 浩哥哥 on 2017/6/15.
//  Copyright © 2017年 浩哥哥. All rights reserved.
//

#import "OrderFirstViewController.h"
#import "TopBtnView.h"

@interface OrderFirstViewController ()<UITableViewDelegate, UITableViewDataSource>

/** 顶部的按钮 **/
@property (nonatomic, strong) TopBtnView *topBtn;


@property (nonatomic, strong) UITableView *tableView;

@end

@implementation OrderFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"运营支撑系统";
    
    [self reloadUI];
}


























#pragma mark -- super method 
- (void)reloadUI{
    
    [self showBarButton:NAV_LEFT imageName:@"btn_notification"];
    [self showBarButton:NAV_RIGHT imageName:@"btn_form"];
    
    //创建顶部的按钮
    NSArray *titlesArray = @[@"所有任务",@"我创建的",@"我的待办",@"我的已办"];
    
    //创建顶部的三个按钮
    [self creatSubViewsWithArray:titlesArray];
    
    //reload tableView
    [self.view addSubview:_tableView];
    
    
}

- (void)leftBtnAction:(id)sender
{
    kMyLog(@"左侧按钮的点击事件");
}

- (void)rightBtnAction:(id)sender
{
    kMyLog(@"右侧按钮的点击事件");
}

#pragma mark -- UITableViewDelegate && UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    return cell;
}

#pragma mark -- private method
- (void)creatSubViewsWithArray:(NSArray *)array{
    for (int i = 0; i < array.count; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i * (ScreenWidth/array.count), 64, ScreenWidth/array.count, 30)];
        btn.tag = 1000 + i;
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:kBlack forState:UIControlStateNormal];
        [btn setTitleColor:kBlue forState:UIControlStateSelected];
        [self.view addSubview:btn];
        
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        //创建下面的那条线
        UIView *lineView = [[UIView alloc]init];
        lineView.tag = 500 + i;
        lineView.backgroundColor = kBlack;
        [self.view addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(btn.titleLabel);
            make.top.equalTo(btn.mas_bottom).offset(2);
            make.height.mas_equalTo(0.5);
        }];
    }
}

- (void)btnAction:(UIButton *)sender{
    NSLog(@"%ld", sender.tag - 1000);
    for (int i = 0; i < 4; i ++) {
        if (i == sender.tag - 1000) {
            sender.selected = YES;
            UIView *view = [self.view viewWithTag:500 + i];
            view.backgroundColor = kBlue;
            continue;
        }
        sender.selected = NO;
        UIView *view = [self.view viewWithTag:500 + i];
        view.backgroundColor = kBlack;
    }
}




#pragma mark -- lazy
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.frame = CGRectMake(0, 34.5, ScreenWidth, ScreenHeight - 35);
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}




@end
