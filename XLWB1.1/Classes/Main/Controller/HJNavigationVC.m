//
//  HJNavigationVC.m
//  心浪微勃
//
//  Created by geekgourp-1 on 16/8/6.
//  Copyright (c) 2016年 geekgourp-1. All rights reserved.
//

#import "HJNavigationVC.h"

@interface HJNavigationVC ()

@end

@implementation HJNavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

+(void)initialize
{
    [[UINavigationBar appearance] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"navigationbar_background"]]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22]}];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateNormal];
    
}

@end
