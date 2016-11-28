//
//  HJStatusResult.m
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/23.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import "HJStatusResult.h"
#import "HJStatus.h"
@implementation HJStatusResult
+(NSDictionary *)objectClassInArray
{
    return @{@"statuses":[HJStatus class]};
}

@end
