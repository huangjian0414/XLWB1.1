//
//  HJRetweetView.m
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/25.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import "HJRetweetView.h"
#import "HJStatus.h"
#import "HJStatusFrame.h"

#define HJStatusCellMargin 10
#define HJNameFont [UIFont systemFontOfSize:13]
#define HJTimeFont [UIFont systemFontOfSize:12]
#define HJSourceFont HJTimeFont
#define HJTextFont [UIFont systemFontOfSize:15]
#define HJScreenW [UIScreen mainScreen].bounds.size.width

@interface HJRetweetView()
//昵称
@property (nonatomic,weak)UILabel *nameLable;

//正文
@property (nonatomic,weak)UILabel *textLable;

@end
@implementation HJRetweetView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
        [self setUpAllChildView];
        self.userInteractionEnabled=YES;
        self.image=[UIImage imageNamed:@"timeline_retweet_background"];
    }
    return self;
}

-(void)setUpAllChildView
{
       //昵称
    UILabel *nameLable=[[UILabel alloc]init];
    nameLable.textColor=[UIColor blueColor];
    nameLable.font=HJNameFont;
    [self addSubview:nameLable];
    _nameLable=nameLable;
  
    //正文
    UILabel *textLable=[[UILabel alloc]init];
    textLable.font=HJTextFont;
    textLable.numberOfLines=0;
    [self addSubview:textLable];
    _textLable=textLable;
}
-(void)setStatusF:(HJStatusFrame *)statusF
{
    _statusF=statusF;
    HJStatus *status=statusF.status;
    
    //昵称
    _nameLable.frame=statusF.retweetNameFrame;
    _nameLable.text=status.retweetName;
    //正文
    _textLable.frame=statusF.retweetTextFrame;
    _textLable.text=status.retweeted_status.text;
    
}


@end
