//
//  HJTitleBtn.m
//  心浪微勃
//
//  Created by geekgourp-1 on 16/8/6.
//  Copyright (c) 2016年 geekgourp-1. All rights reserved.
//

#import "HJTitleBtn.h"
#import "UIImage+HJOriginalImage.h"
#import "HJUserTool.h"
#import "HJUser.h"
#import "HJAccount.h"
#import "HJAccountTool.h"


#define ImageWidth 20
@implementation HJTitleBtn

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.adjustsImageWhenHighlighted=NO;
        
        //当前用户昵称
        [HJUserTool userInfoWithSuccess:^(HJUser *user) {
            
            [self setTitle:user.name forState:UIControlStateNormal];
            
//            HJAccount *account=[HJAccountTool account];
//            account.name=user.name;
//            
//            [HJAccountTool saveAccount:account];
            
            
        } failure:^(NSError *error) {
            
        }];
        
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  
        [self setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
        
        self.imageView.contentMode=UIViewContentModeCenter;
        
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        
        self.titleEdgeInsets=UIEdgeInsetsMake(0, 0, 0, 20);

    }
    
    return self;
}



-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = ImageWidth;
    CGFloat imageH = contentRect.size.height;
    CGFloat imageX = contentRect.size.width - imageW - 20;
    CGFloat imageY = 0;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}


- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleW = contentRect.size.width - ImageWidth-10;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}


@end
