//
//  UIBarButtonItem+HJItem.h
//  心浪微勃
//
//  Created by geekgourp-1 on 16/8/6.
//  Copyright (c) 2016年 geekgourp-1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HJItem)

+(UIBarButtonItem *)barBtnItemWithImg:(UIImage *)image highImg:(UIImage *)highimage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
