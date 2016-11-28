//
//  HJStatusTool.h
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/23.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
// 处理微博数据

#import <Foundation/Foundation.h>

@interface HJStatusTool : NSObject

+(void)newStatusWithSinceId:(NSString *)sinceId success:(void(^)(NSArray *statuses))success failure:(void(^)(NSError *error))failure;

+(void)moreStatusWithMaxId:(NSString *)maxId success:(void(^)(NSArray *statuses))success failure:(void(^)(NSError *error))failure;
@end
