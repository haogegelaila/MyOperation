//
//  NetWorkDefine.h
//  MyOperationSystem
//
//  Created by 浩哥哥 on 2017/6/14.
//  Copyright © 2017年 浩哥哥. All rights reserved.
//

#ifndef NetWorkDefine_h
#define NetWorkDefine_h

#define Release_API_MODE 0

//接口模式
//接口模式
#        if RELEASE_API_MODE == 0
#          define BASE_IP @"http://api.mis.dev.gegebox.com"
#        elif RELEASE_API_MODE == 1
#          define BASE_IP @"https://mis.gegebox.com"
#        else
#        endif
#endif


