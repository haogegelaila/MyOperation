//
//  AFTool.m
//  MyOperationSystem
//
//  Created by 浩哥哥 on 2017/6/14.
//  Copyright © 2017年 浩哥哥. All rights reserved.
//

#import "AFTool.h"

@implementation AFTool
+ (AFHTTPSessionManager *)manager
{
    static AFHTTPSessionManager * instance ;
    static dispatch_once_t onceToken;
    
    
    dispatch_once(&onceToken, ^{
        
        instance = [[AFHTTPSessionManager alloc]init];
        
        NSSet *acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                         @"text/html",
                                         @"text/json",
                                         @"text/javascript",
                                         @"text/plain", nil];
        
        // instance.requestSerializer = [AFJSONRequestSerializer serializer];
        // instance.responseSerializer = [AFJSONResponseSerializer serializer];
        
        instance.requestSerializer.timeoutInterval = 5;
        instance.responseSerializer.acceptableContentTypes = acceptableContentTypes;
        instance.requestSerializer.allowsCellularAccess = YES;
        instance.requestSerializer.HTTPShouldHandleCookies = YES;
        
    });
    
    return instance;
}
@end
