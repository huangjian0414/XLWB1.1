//
//  HJUserTool.h
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/23.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HJUserResult,HJUser;
@interface HJUserTool : NSObject
+(void)unreadWithSuccess:(void(^)(HJUserResult *result))success failure:(void(^)(NSError *error))failure;


+(void)userInfoWithSuccess:(void(^)(HJUser *user))success failure:(void(^)(NSError *error))failure;

@end
