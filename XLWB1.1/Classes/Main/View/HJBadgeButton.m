//
//  HJBadgeButton.m
//  心浪微勃
//
//  Created by geekgourp-1 on 16/8/3.
//  Copyright (c) 2016年 geekgourp-1. All rights reserved.
//

#import "HJBadgeButton.h"

#define TitleFont [UIFont systemFontOfSize:11]
@implementation HJBadgeButton


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.userInteractionEnabled=NO;
        
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        
        self.titleLabel.font=TitleFont;
        
        [self sizeToFit];
        
    }
    
    return self;
}

-(void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue=badgeValue;
    
    if (_badgeValue.length==0||[_badgeValue isEqualToString:@"0"]) {
        self.hidden=YES;
    }else
    {
        self.hidden=NO;
    }
    
    //获取传递过来的badgevalue的文本尺寸
    CGSize size=[_badgeValue sizeWithAttributes:@{NSFontAttributeName:TitleFont}];
    
    if (size.width > self.bounds.size.width) {
        
        [self setImage:[UIImage imageNamed:@"new_dot"] forState:UIControlStateNormal];
        
        [self setBackgroundImage:nil forState:UIControlStateNormal];
        
        [self setTitle:nil forState:UIControlStateNormal];
        
    }else
    {
        
        [self setTitle:_badgeValue forState:UIControlStateNormal];
        
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        
        [self setImage:nil forState:UIControlStateNormal];
    }

    
    
}


@end
