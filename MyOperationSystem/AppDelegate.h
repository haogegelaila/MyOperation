//
//  AppDelegate.h
//  MyOperationSystem
//
//  Created by 浩哥哥 on 2017/6/12.
//  Copyright © 2017年 浩哥哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Reachability.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,UINavigationBarDelegate>

@property (strong, nonatomic) UIWindow *window;
/** 负责网络监听 **/
@property (nonatomic, strong) Reachability *hostReachability;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

@property (nonatomic, strong)UINavigationController *mainNav;

@property (nonatomic, assign)NSInteger InternetStatus;

+ (AppDelegate *)appDelegate;

+ (AppDelegate *)shareInstance;


- (void)saveContext;


@end

