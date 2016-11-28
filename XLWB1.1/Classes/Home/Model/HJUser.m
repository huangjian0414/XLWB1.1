//
//  HJUser.m
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/17.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import "HJUser.h"

@implementation HJUser
-(void)setMbtype:(int)mbtype
{
    _mbtype=mbtype;
    _vip=mbtype>2;
}

@end
