//
//  HJStatusParam.h
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/23.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 access_token 	true 	string 	采用OAuth授权方式为必填参数，OAuth授权后获得。
 since_id 	false 	int64 	若指定此参数，则返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0。
 max_id 	false 	int64
 */
@interface HJStatusParam : NSObject

@property (nonatomic,copy)NSString *access_token;

@property (nonatomic,copy)NSString *since_id;

@property (nonatomic,copy)NSString *max_id;

@end
