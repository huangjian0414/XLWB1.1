//
//  HJUserResult.h
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/23.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 status 	int 	新微博未读数
 follower 	int 	新粉丝数
 cmt 	int 	新评论数
 dm 	int 	新私信数
 mention_status 	int 	新提及我的微博数
 mention_cmt 	int 	新提及我的评论数
 */

@interface HJUserResult : NSObject
@property (nonatomic,assign)int status;

@property (nonatomic,assign)int follower;

@property (nonatomic,assign)int cmt;

@property (nonatomic,assign)int dm;

@property (nonatomic,assign)int mention_status;

@property (nonatomic,assign)int mention_cmt;

-(int)messageCount;
-(int)totoalCount;

@end
