//
//  HJRootTool.m
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/17.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import "HJRootTool.h"
#import "HJTabbarVC.h"
#import "HJNewFeatureVC.h"

@implementation HJRootTool

+(void)chooseRootViewController:(UIWindow *)window
{
    NSString *lastVersion=[[NSUserDefaults standardUserDefaults]objectForKey:@"CFBundleShortVersionString"];
    
    NSString *infoPath=[[NSBundle mainBundle]pathForResource:@"Info.plist" ofType:nil];
    NSDictionary *dict=[NSDictionary dictionaryWithContentsOfFile:infoPath];
    NSString *currentVersion=dict[@"CFBundleShortVersionString"];
    
    if ([currentVersion isEqualToString:lastVersion]) {
        
        HJTabbarVC *tabbarVc=[[HJTabbarVC alloc]init];
        window.rootViewController=tabbarVc;
    }else
    {
        HJNewFeatureVC *vc=[[HJNewFeatureVC alloc]init];
        window.rootViewController=vc;
        
        [[NSUserDefaults standardUserDefaults]setObject:currentVersion forKey:@"CFBundleShortVersionString"];
    }
    
}



@end
