//
//  HJUser.h
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/17.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJUser : NSObject
/**
 *  微博昵称
 */
@property (nonatomic,copy)NSString *name;

/**
 *  微博头像
 */
@property (nonatomic,strong)NSURL *profile_image_url;
/**
 *  会员类型 >2代表时会员
 */
@property (nonatomic,assign)int mbtype;
/**
 *  会员等级
 */
@property (nonatomic,assign)int mbrank;

@property (nonatomic,assign,getter=isVip)BOOL vip;
@end
