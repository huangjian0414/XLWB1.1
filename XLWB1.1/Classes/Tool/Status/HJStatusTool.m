//
//  HJStatusTool.m
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/23.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import "HJStatusTool.h"
#import "HJHttpTool.h"
#import "HJAccountTool.h"
#import "HJAccount.h"
#import "HJStatus.h"
#import "HJStatusParam.h"

#import "HJStatusResult.h"
@implementation HJStatusTool

+(void)newStatusWithSinceId:(NSString *)sinceId success:(void(^)(NSArray *statuses))success failure:(void(^)(NSError *error))failure
{
    HJStatusParam *param=[[HJStatusParam alloc]init];
    param.access_token=[HJAccountTool account].access_token;
       if (sinceId) {
       param.since_id=sinceId;
    }
    
    [HJHttpTool GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:param.keyValues success:^(id responseObject) {
        
        HJStatusResult *result=[HJStatusResult objectWithKeyValues:responseObject];
        
//        NSArray *dictArr=responseObject[@"statuses"];
//        //字典数组转换成模型数组
//        NSArray *statuses=[HJStatus objectArrayWithKeyValuesArray:dictArr];
        
        if (success) {
            success(result.statuses);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
        
    }];
}

+(void)moreStatusWithMaxId:(NSString *)maxId success:(void(^)(NSArray *statuses))success failure:(void(^)(NSError *error))failure
{
    HJStatusParam *param=[[HJStatusParam alloc]init];
    param.access_token=[HJAccountTool account].access_token;
        if (maxId) {
        param.max_id=maxId;
    }
    
   
    [HJHttpTool GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:param.keyValues success:^(id responseObject) {
        
//        NSArray *dictArr=responseObject[@"statuses"];
//        
//        //字典数组转换成模型数组
//        NSArray *statuses=(NSMutableArray *)[HJStatus objectArrayWithKeyValuesArray:dictArr];
        HJStatusResult *result=[HJStatusResult objectWithKeyValues:responseObject];
        
        if (success) {
            success(result.statuses);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }]; 
}


@end
