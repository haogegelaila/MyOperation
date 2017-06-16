//
//  AFNetworkRequest.m
//  MyOperationSystem
//
//  Created by 浩哥哥 on 2017/6/14.
//  Copyright © 2017年 浩哥哥. All rights reserved.
//

#import "AFNetworkRequest.h"
#import "Reachability.h"
#import "AppDelegate.h"
#import "AFTool.h"

@implementation AFNetworkRequest

+ (id)request
{
    return [[[self class]alloc]init];
}

- (void)startRequest:(NSString *)url requestType:(netRequestType)type params:(id)params resultHandle:(AFReqestResultBlock)resultHandle
{
    if (NotReachable == [AppDelegate appDelegate].InternetStatus) {
        
        //没有网络
        NSError *err = [[NSError alloc]initWithDomain:@"" code:404 userInfo:@{@"descripte":@"没有网络"}];
        [self handleRequestResultWithDataTask:nil resobject:nil error:err resultBlock:resultHandle];
        return;
    }
    AFHTTPSessionManager *manager = [AFTool manager];
    
    //根据请求类型进行判断
    switch (type) {
        case netRequestTypePOST:
        {
            [manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self handleRequestResultWithDataTask:task resobject:responseObject error:nil resultBlock:resultHandle];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleRequestResultWithDataTask:task resobject:nil error:error resultBlock:resultHandle];
            }];
            break;
    }
    
            case netRequestTypeGet:
        {
            [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self handleRequestResultWithDataTask:task resobject:responseObject error:nil resultBlock:resultHandle];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleRequestResultWithDataTask:task resobject:nil error:error resultBlock:resultHandle];
            }];
            break;
        }
            
            case netRequestTypeDelete:
        {
            [manager DELETE:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self handleRequestResultWithDataTask:task resobject:responseObject error:nil resultBlock:resultHandle];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleRequestResultWithDataTask:task resobject:nil error:error resultBlock:resultHandle];
            }];
            break;
        }
            
        default:
            break;
    }
}

//网络请求结果展示
- (void)handleRequestResultWithDataTask:(NSURLSessionDataTask *)task resobject:(id)resobject error:(NSError *)error resultBlock:(AFReqestResultBlock)resultBlock
{
    if (Release_API_MODE == 0) {
        //测试环境
        self.enableLog = YES;
    }
    NSURLRequest *request = task.currentRequest;
    NSURLResponse *response = task.response;
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if (self.enableLog && task) {
        NSLog(@"  %@  '%@' : %@", [request HTTPMethod], [request URL].absoluteString, [request allHTTPHeaderFields]);
        NSLog(@"response:  %@ '%@'  ",[httpResponse URL], [httpResponse allHeaderFields]);

    }
    
    NSDictionary *responseJson = resobject;
    if (resobject) {
        NSData *jsobData = [NSJSONSerialization dataWithJSONObject:resobject options:NSJSONWritingPrettyPrinted error:nil];
        responseJson = [NSJSONSerialization JSONObjectWithData:jsobData options:NSJSONReadingMutableContainers error:nil];
    }
    
    if (resultBlock) {
        resultBlock(responseJson, error);
    }
    
}
@end
