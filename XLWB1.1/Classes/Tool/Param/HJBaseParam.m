//
//  HJBaseParam.m
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/23.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import "HJBaseParam.h"
#import "HJAccountTool.h"
#import "HJAccount.h"

@implementation HJBaseParam

+(instancetype)param
{
    HJBaseParam *param=[[self alloc]init];
    param.access_token=[HJAccountTool account].access_token;
    
    return param;
}

@end
