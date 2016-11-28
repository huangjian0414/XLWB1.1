//
//  HJAccountTool.h
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/16.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
// 专门出来账号的业务（账号存储，读取）

#import <Foundation/Foundation.h>
@class HJAccount;
@interface HJAccountTool : NSObject
+(void)saveAccount:(HJAccount *)account;

+(HJAccount *)account;

+(void)accountWithCode:(NSString *)code success:(void(^)())success failure:(void(^)(NSError *error))failure;
@end
