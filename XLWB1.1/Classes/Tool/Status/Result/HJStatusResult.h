//
//  HJStatusResult.h
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/23.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface HJStatusResult : NSObject<MJKeyValue>

@property (nonatomic,strong)NSArray *statuses;

//最近微博总数
@property (nonatomic,assign)int *total_number;

@end
