//
//  HJBaseParam.h
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/23.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJBaseParam : NSObject
@property (nonatomic,copy)NSString *access_token;

+(instancetype)param;

@end
