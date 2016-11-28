//
//  HJSearchBar.m
//  心浪微勃
//
//  Created by geekgourp-1 on 16/8/7.
//  Copyright (c) 2016年 geekgourp-1. All rights reserved.
//

#import "HJSearchBar.h"
#import "UIImage+HJOriginalImage.h"

@implementation HJSearchBar


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
        self.font=[UIFont systemFontOfSize:13];
        self.background=[UIImage stretchableImageWithName:@"searchbar_textfield_background"];
        
        UIImageView *imageV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        imageV.bounds=CGRectMake(0, 0, 30, 40);
        imageV.contentMode=UIViewContentModeCenter;
        
        self.leftView=imageV;
        
        self.leftViewMode=UITextFieldViewModeAlways;
        self.returnKeyType=UIReturnKeySearch;
        self.clearButtonMode=UITextFieldViewModeAlways;
        self.enablesReturnKeyAutomatically=YES;
        
    }
    
    
    return self;
    
}


@end
