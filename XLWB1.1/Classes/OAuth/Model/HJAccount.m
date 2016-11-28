//
//  HJAccount.m
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/16.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import "HJAccount.h"
#import "MJExtension.h"

#define HJAccountTokenKey @"token"
#define HJUidKey @"uid"
#define HJExpires_inKey @"expires"
#define HJExpires_dateKey @"date"
#define HJNameKey @"name"

@implementation HJAccount

MJCodingImplementation

+(instancetype)accountWithDict:(NSDictionary *)dict
{
    
    HJAccount *account=[[self alloc]init];
    [account setValuesForKeysWithDictionary:dict];
    
    return account;    
}

//-(void)encodeWithCoder:(NSCoder *)aCoder
//{
//    [aCoder encodeObject:_access_token forKey:HJAccountTokenKey];
//    [aCoder encodeObject:_uid forKey:HJUidKey];
//    [aCoder encodeObject:_expires_in forKey:HJExpires_inKey];
//    [aCoder encodeObject:_expires_date forKey:HJExpires_dateKey];
//    [aCoder encodeObject:_name forKey:HJNameKey];
//}

//-(instancetype)initWithCoder:(NSCoder *)aDecoder
//{
//    if (self=[super init]) {
//        _access_token=[aDecoder decodeObjectForKey:HJAccountTokenKey];
//        _expires_in=[aDecoder decodeObjectForKey:HJExpires_inKey];
//        _uid=[aDecoder decodeObjectForKey:HJUidKey];
//        _expires_date=[aDecoder decodeObjectForKey:HJExpires_dateKey];
//        _name=[aDecoder decodeObjectForKey:HJNameKey];
//    }
//    return self;
//}
-(void)setExpires_in:(NSString *)expires_in
{
    _expires_in=expires_in;
    _expires_date=[NSDate dateWithTimeIntervalSinceNow:[_expires_in longLongValue]];
}


@end
