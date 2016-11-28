//
//  HJHttpTool.h
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/20.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
// 处理网络请求

#import <Foundation/Foundation.h>

@interface HJHttpTool : NSObject

//get
+ (void)GET:(NSString *)URLString
                    parameters:(id)parameters
                    success:(void (^)(id responseObject))success
                    failure:(void (^)(NSError *error))failure;


+ (void)POST:(NSString *)URLString
                    parameters:(id)parameters
                    success:(void (^)(id responseObject))success
                    failure:(void (^)(NSError *error))failure;


@end
