//
//  HJUserTool.m
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/23.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import "HJUserTool.h"
#import "HJHttpTool.h"

#import "HJUserParam.h"
#import "HJUserResult.h"
#import "HJAccountTool.h"
#import "HJAccount.h"
#import "HJUser.h"

#import "MJExtension.h"

@implementation HJUserTool

+(void)unreadWithSuccess:(void(^)(HJUserResult *result))success failure:(void(^)(NSError *error))failure
{
    HJUserParam *param=[HJUserParam param];
    param.uid=[HJAccountTool account].uid;
  
    [HJHttpTool GET:@"https://rm.api.weibo.com/2/remind/unread_count.json" parameters:param.keyValues success:^(id responseObject) {
        //字典转模型
        HJUserResult *result=[HJUserResult objectWithKeyValues:responseObject];

        if (success) {
            
            success(result);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
        
    }];
    
}
+(void)userInfoWithSuccess:(void (^)(HJUser *))success failure:(void (^)(NSError *))failure
{
    HJUserParam *param=[HJUserParam param];
    param.uid=[HJAccountTool account].uid;
    [HJHttpTool GET:@"https://api.weibo.com/2/users/show.json" parameters:param.keyValues success:^(id responseObject) {
    
        HJUser *user=[HJUser objectWithKeyValues:responseObject];
        if (success) {
            success(user);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
        
    }];
    
}


@end
