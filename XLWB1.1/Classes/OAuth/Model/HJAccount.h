//
//  HJAccount.h
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/16.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 "access_token" = "2.00dC7oUDf7gkvB52a35663930g4GY9";
 "expires_in" = 157679999;
 "remind_in" = 157679999;
 uid = 3203705083;
 */
@interface HJAccount : NSObject<NSCoding>

@property (nonatomic,copy)NSString *access_token;
@property (nonatomic,copy)NSString *expires_in;
@property (nonatomic,copy)NSString *remind_in;
@property (nonatomic,copy)NSString *uid;

@property (nonatomic,strong)NSDate *expires_date;

//用户昵称
@property (nonatomic,copy)NSString *name;

+(instancetype)accountWithDict:(NSDictionary *)dict;

@end
