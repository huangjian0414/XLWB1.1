//
//  HJStatusToolBar.m
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/25.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import "HJStatusToolBar.h"
#import "UIImage+HJOriginalImage.h"

#define HJScreenW [UIScreen mainScreen].bounds.size.width

@interface HJStatusToolBar()

@property (nonatomic,strong)NSMutableArray *btns;
@property (nonatomic,strong)NSMutableArray *divideVs;
@end
@implementation HJStatusToolBar

-(NSMutableArray *)btns
{
    if (_btns==nil) {
        _btns=[NSMutableArray array];
    }
    return _btns;
}

-(NSMutableArray *)divideVs
{
    if (_divideVs==nil) {
        _divideVs=[NSMutableArray array];
    }
    return _divideVs;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
        [self setUpAllChildView];
        self.userInteractionEnabled=YES;
        self.image=[UIImage stretchableImageWithName:@"timeline_card_bottom_background"];
            
    }
    return self;
}

-(void)setUpAllChildView
{
    //转发
    UIButton *retweet= [self setUpOneButtonWithTitle:@"转发" image:[UIImage imageNamed:@"timeline_icon_retweet"]];

    //评论
    UIButton *comment= [self setUpOneButtonWithTitle:@"评论" image:[UIImage imageNamed:@"timeline_icon_comment"]];
    //赞
    UIButton *unlike= [self setUpOneButtonWithTitle:@"赞" image:[UIImage imageNamed:@"timeline_icon_unlike"]];
    
    for (int i=0; i<2; i++) {
        UIImageView *divideV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timeline_card_bottom_line"]];
        [self addSubview:divideV];
        
        [self.divideVs addObject:divideV];
    
    }
}

-(UIButton *)setUpOneButtonWithTitle:(NSString *)title  image:(UIImage *)image
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:12];
    btn.titleEdgeInsets=UIEdgeInsetsMake(0, 5, 0, 0);
    
    [self addSubview:btn];
    [self.btns addObject:btn];
    return btn;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    NSUInteger count=self.btns.count;
    CGFloat w=HJScreenW/count;
    CGFloat h=self.frame.size.height;
    CGFloat x=0;
    CGFloat y=0;
    for (int i=0; i<count; i++) {
        UIButton *btn=self.btns[i];
        x=i*w;
        btn.frame=CGRectMake(x, y, w, h);
    }
    int i=1;
    for (UIImageView *divide in self.divideVs) {
        UIButton *btn=self.btns[i];
        divide.frame=CGRectMake(btn.frame.origin.x, 0, 1, btn.bounds.size.height);
        i++;
        
    }
    
}

@end
