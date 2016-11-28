//
//  HJAccountTool.m
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/16.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import "HJAccountTool.h"
#import "HJAccount.h"
#import "AFNetworking.h"
#import "HJRootTool.h"
#import "HJHttpTool.h"
#import "HJAccountParam.h"
#import "MJExtension.h"

#define HJBaseUrl @"https://api.weibo.com/oauth2/authorize"
#define HJClient_id @"1769510173"
#define HJRedirect_uri @"http://www.baidu.com"
#define HJClient_secret @"7f3f14b511e11adab16d0874e268efb2"

#define HJAcountFile [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account.data"]

@implementation HJAccountTool

static HJAccount *_account;
+(void)saveAccount:(HJAccount *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:HJAcountFile];
}

+(HJAccount *)account
{
    if (_account==nil) {
        _account=[NSKeyedUnarchiver unarchiveObjectWithFile:HJAcountFile];
        
        if ([[NSDate date] compare:_account.expires_date]!=NSOrderedAscending) {
            return nil;
        }
        
    }
    
    return _account;
}

+(void)accountWithCode:(NSString *)code success:(void(^)())success failure:(void(^)(NSError *error))failure
{
        
    HJAccountParam *param=[[HJAccountParam alloc]init];
    param.client_id=HJClient_id;
    param.client_secret=HJClient_secret;
    param.grant_type=@"authorization_code";
    param.code=code;
    param.redirect_uri=HJRedirect_uri;
    [HJHttpTool POST:@"https://api.weibo.com/oauth2/access_token" parameters:param.keyValues success:^(id responseObject) {
        if (success) {
            HJAccount *account=[HJAccount accountWithDict:responseObject];
            [HJAccountTool saveAccount:account];
            success();
        }
        
    } failure:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
    
}

@end
