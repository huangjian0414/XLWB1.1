//
//  UIBarButtonItem+HJItem.m
//  心浪微勃
//
//  Created by geekgourp-1 on 16/8/6.
//  Copyright (c) 2016年 geekgourp-1. All rights reserved.
//

#import "UIBarButtonItem+HJItem.h"

@implementation UIBarButtonItem (HJItem)

+(UIBarButtonItem *)barBtnItemWithImg:(UIImage *)image highImg:(UIImage *)highimage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:highimage forState:UIControlStateHighlighted];
//    btn.bounds=CGRectMake(0, 0, 30, 30);
    
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:controlEvents];
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
    
}
@end
