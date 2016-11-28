//
//  HJStatus.h
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/17.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJUser.h"
#import "MJExtension.h"

/*
 created_at 	string 	微博创建时间 
 idstr 	string 	字符串型的微博ID 
 text 	string 	微博信息内容 
 source 	string 	微博来源 
 user 	object 	微博作者的用户信息字段 详细
 retweeted_status 	object 	被转发的原微博信息字段，当该微博为转发微博时返回 详细
 reposts_count 	int 	转发数
 comments_count 	int 	评论数
 attitudes_count 	int 	表态数
 pic_urls 配图数组
 pic_ids 	object 	微博配图ID。多图时返回多图ID，用来拼接图片url。用返回字段thumbnail_pic的地址配上该返回字段的图片ID，即可得到多个图片url。
 */

@interface HJStatus : NSObject<MJKeyValue>

@property (nonatomic,strong)HJStatus *retweeted_status;
/**
 *  转发微博昵称
 */
@property (nonatomic,copy)NSString *retweetName;

@property (nonatomic,strong)HJUser *user;

@property (nonatomic,copy)NSString *created_at;

@property (nonatomic,copy)NSString *idstr;

@property (nonatomic,copy)NSString *text;

@property (nonatomic,copy)NSString *source;

@property (nonatomic,assign)int reposts_count;

@property (nonatomic,assign)int comments_count;

@property (nonatomic,assign)int attitudes_count;

@property (nonatomic,strong)NSArray *pic_urls;





@end
