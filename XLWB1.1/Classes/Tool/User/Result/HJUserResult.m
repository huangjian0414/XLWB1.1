//
//  HJUserResult.m
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/23.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import "HJUserResult.h"

@implementation HJUserResult

-(int)messageCount
{
    return _cmt+_dm+_mention_cmt+_mention_status;
    
}

-(int)totoalCount
{
    return self.messageCount+_status+_follower;
}
@end
