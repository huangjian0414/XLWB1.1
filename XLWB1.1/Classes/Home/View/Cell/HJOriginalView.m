//
//  HJOriginalView.m
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/25.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import "HJOriginalView.h"
#import "HJStatusFrame.h"
#import "HJStatus.h"

#import "UIImageView+WebCache.h"

#define HJStatusCellMargin 10
#define HJNameFont [UIFont systemFontOfSize:13]
#define HJTimeFont [UIFont systemFontOfSize:12]
#define HJSourceFont HJTimeFont
#define HJTextFont [UIFont systemFontOfSize:15]
#define HJScreenW [UIScreen mainScreen].bounds.size.width

@interface HJOriginalView()
//头像
@property (nonatomic,weak)UIImageView *iconView;

//昵称
@property (nonatomic,weak)UILabel *nameLable;

//vip
@property (nonatomic,weak)UIImageView *vipView;
//时间
@property (nonatomic,weak)UILabel *timeLable;
//来源
@property (nonatomic,weak)UILabel *sourceLable;

//正文
@property (nonatomic,weak)UILabel *textLable;

@end

@implementation HJOriginalView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
        [self setUpAllChildView];
        
        self.userInteractionEnabled=YES;
        self.image=[UIImage imageNamed:@"timeline_card_top_background"];
    }
    return self;
}

-(void)setUpAllChildView
{
    //头像
    UIImageView *iconView=[[UIImageView alloc]init];
    [self addSubview:iconView];
    _iconView=iconView;
    //昵称
    UILabel *nameLable=[[UILabel alloc]init];
    nameLable.font=HJNameFont;
    [self addSubview:nameLable];
    _nameLable=nameLable;
    //vip
    UIImageView *vipView=[[UIImageView alloc]init];
    [self addSubview:vipView];
    _vipView=vipView;
    //时间
    UILabel *timeLable=[[UILabel alloc]init];
    timeLable.font=HJTimeFont;
    timeLable.textColor=[UIColor orangeColor];
    [self addSubview:timeLable];
    _timeLable=timeLable;
    //来源
    UILabel *sourceLable=[[UILabel alloc]init];
    sourceLable.font=HJSourceFont;
    [self addSubview:sourceLable];
    _sourceLable=sourceLable;
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
    //设置frame
    [self setUpFrame];
    //设置data
    [self setUpData];
    
}

-(void)setUpData
{
    HJStatus *status=_statusF.status;
    //头像
    [_iconView sd_setImageWithURL:status.user.profile_image_url placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    //昵称
    if (status.user.vip) {
        _nameLable.textColor=[UIColor redColor];
    }else
    {
        _nameLable.textColor=[UIColor blackColor];
    }
    
    _nameLable.text=status.user.name;
    //vip
    NSString *imageName=[NSString stringWithFormat:@"common_icon_membership_level%d",status.user.mbrank];
    _vipView.image=[UIImage imageNamed:imageName];
    //时间
    _timeLable.text=status.created_at;
    //来源
    
    _sourceLable.text=status.source;
    //正文
    _textLable.text=status.text;
}
-(void)setUpFrame
{
    //头像
    _iconView.frame=_statusF.originalIconFrame;
    
    //昵称
    _nameLable.frame=_statusF.originalNameFrame;
    //VIP
    if (_statusF.status.user.vip) {//时vip
        _vipView.hidden=NO;
        _vipView.frame=_statusF.originalVipFrame;
    }else
    {
        _vipView.hidden=YES;
    }
    //时间  每次有新的时间都需要 计算时间frame
    HJStatus *status=_statusF.status;
    CGFloat timeX=_nameLable.frame.origin.x;
    CGFloat timeY=CGRectGetMaxY(_nameLable.frame)+HJStatusCellMargin*0.5;
    CGSize timeSize=[status.created_at sizeWithAttributes:@{NSFontAttributeName:HJTimeFont}];
    _timeLable.frame=(CGRect){{timeX,timeY},timeSize};
   
    //来源
    CGFloat sourceX=CGRectGetMaxX(_timeLable.frame)+HJStatusCellMargin;
    CGFloat sourceY=timeY;
    CGSize sourceSize=[status.source sizeWithAttributes:@{NSFontAttributeName:HJSourceFont}];
    _sourceLable.frame=(CGRect){{sourceX,sourceY},sourceSize};
  
    //正文
    _textLable.frame=_statusF.originalTextFrame;
    
}






@end
