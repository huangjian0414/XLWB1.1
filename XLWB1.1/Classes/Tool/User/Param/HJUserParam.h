//
//  HJUserParam.h
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/23.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJBaseParam.h"
/*
 access_token 	false 	string 	采用OAuth授权方式为必填参数，其他授权方式不需要此参数，OAuth授权后获得。
 uid 	true 	int64 	需要获取消息未读数的用户UID，必须是当前登录用户。
 */
@interface HJUserParam : HJBaseParam

@property (nonatomic,copy)NSString *uid;

@end
