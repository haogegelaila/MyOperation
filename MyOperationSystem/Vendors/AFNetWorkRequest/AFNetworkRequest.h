//
//  AFNetworkRequest.h
//  MyOperationSystem
//
//  Created by 浩哥哥 on 2017/6/14.
//  Copyright © 2017年 浩哥哥. All rights reserved.
//

#import <Foundation/Foundation.h>
/** 网络请求的方式 **/
typedef NS_ENUM(NSInteger, netRequestType) {
    
    /**
     *  get 请求方式
     */
    netRequestTypeGet = 0,
    
    /**
     *  post 请求方式
     */
    netRequestTypePOST = 1,
    
    /**
     *  delete 请求方式
     */
    netRequestTypeDelete = 2,
};

/** 请求结束后执行的 block **/
typedef void(^AFReqestResultBlock)(id responseObj, NSError * err);

/**
 *  轻量级封装 AFNetWorking 的常用功能
 */

@interface AFNetworkRequest : NSObject

/** 是否打印 request 的相关信息 **/
@property (nonatomic, assign) BOOL enableLog;

+(id)request;

/**
 *   请求方式
 *   @param url  请求的接口地址
 *   @param type 请求的类型
 *   @param params 请求的参数
 *   @param requestHandle 请求结束后执行的 Block
 */
- (void)startRequest:(NSString *)url requestType:(netRequestType )type params:(id)params resultHandle:(AFReqestResultBlock)requestHandle;





@end
