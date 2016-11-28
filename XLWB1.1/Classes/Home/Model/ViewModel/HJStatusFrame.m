//
//  HJStatusFrame.m
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/25.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import "HJStatusFrame.h"
#import "HJStatus.h"
#import "HJUser.h"
#define HJStatusCellMargin 10
#define HJNameFont [UIFont systemFontOfSize:13]
#define HJTimeFont [UIFont systemFontOfSize:12]
#define HJSourceFont HJTimeFont
#define HJTextFont [UIFont systemFontOfSize:15]
#define HJScreenW [UIScreen mainScreen].bounds.size.width
@implementation HJStatusFrame

-(void)setStatus:(HJStatus *)status
{
    _status=status;
    //计算原创微博
    [self setUpOriginalViewFrame];
    CGFloat toolBarY=CGRectGetMaxY(_originalViewFrame);
    //计算转发微博
    if (status.retweeted_status) {
        [self setUpRetweetViewFrame];
       toolBarY=CGRectGetMaxY(_retweetViewFrame);
    }
    
    //计算工具条
    CGFloat toolBarX=0;
    CGFloat toolBarW=HJScreenW;
    CGFloat toolBarH=35;
    _toolBarViewFrame=CGRectMake(toolBarX, toolBarY, toolBarW, toolBarH);
    
    //计算cell的高度
    _cellHeight=CGRectGetMaxY(_toolBarViewFrame);
    
}
/**
 *  计算原创微博
 */
-(void)setUpOriginalViewFrame
{
    //头像
    CGFloat imageX=HJStatusCellMargin;
    CGFloat imageY=imageX;
    CGFloat imageWH=35;
    _originalIconFrame=CGRectMake(imageX, imageY, imageWH, imageWH);
    
    //昵称
    CGFloat nameX=CGRectGetMaxX(_originalIconFrame)+HJStatusCellMargin;
    CGFloat nameY=imageY;
    CGSize nameSize=[_status.user.name sizeWithAttributes:@{NSFontAttributeName:HJNameFont}];
    _originalNameFrame=(CGRect){{nameX,nameY},nameSize};
    
    //VIP
    if (_status.user.vip) {
        CGFloat vipX=CGRectGetMaxX(_originalNameFrame)+HJStatusCellMargin;
        CGFloat vipY=nameY;
        CGFloat vipWH=14;
        _originalVipFrame=CGRectMake(vipX, vipY, vipWH, vipWH);
    
    }
    //时间
//    CGFloat timeX=nameX;
//    CGFloat timeY=CGRectGetMaxY(_originalNameFrame)+HJStatusCellMargin*0.5;
//    CGSize timeSize=[_status.created_at sizeWithAttributes:@{NSFontAttributeName:HJTimeFont}];
//    _originalTimeFrame=(CGRect){{timeX,timeY},timeSize};
    //来源
//    CGFloat sourceX=CGRectGetMaxX(_originalTimeFrame)+HJStatusCellMargin;
//    CGFloat sourceY=timeY;
//    CGSize sourceSize=[_status.source sizeWithAttributes:@{NSFontAttributeName:HJSourceFont}];
//     _originalSourceFrame=(CGRect){{sourceX,sourceY},sourceSize};
    //正文
    CGFloat textX=imageX;
    CGFloat textY=CGRectGetMaxY(_originalIconFrame)+HJStatusCellMargin;
    CGFloat screenW=[UIScreen mainScreen].bounds.size.width;
    CGFloat textW=screenW-2*HJStatusCellMargin;
    CGSize textSize=[_status.text boundingRectWithSize:CGSizeMake(textW, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:HJTextFont} context:nil].size;
    _originalTextFrame=(CGRect){{textX,textY},textSize};
    //原创微博的frame
    CGFloat originX=0;
    CGFloat originY=8;
    CGFloat originW=HJScreenW;
    CGFloat originH=CGRectGetMaxY(_originalTextFrame)+HJStatusCellMargin;
    _originalViewFrame=CGRectMake(originX, originY, originW, originH);
    
}
/**
 *  计算转发微博
 */
-(void)setUpRetweetViewFrame
{
    //昵称
    CGFloat nameX=HJStatusCellMargin;
    CGFloat nameY=nameX;
    CGSize nameSize=[_status.retweetName sizeWithAttributes:@{NSFontAttributeName:HJNameFont}];
    _retweetNameFrame=(CGRect){{nameX,nameY},nameSize};
    //正文
    CGFloat textX=nameX;
    CGFloat textY=CGRectGetMaxY(_retweetNameFrame)+HJStatusCellMargin;
    CGFloat textW=HJScreenW-2*HJStatusCellMargin;
    CGSize textSize=[_status.retweeted_status.text boundingRectWithSize:CGSizeMake(textW, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:HJTextFont} context:nil].size;
    _retweetTextFrame=(CGRect){{textX,textY},textSize};

    //转发微博的frame
    CGFloat retweetX=0;
    CGFloat retweetY=CGRectGetMaxY(_originalViewFrame);
    CGFloat retweetW=HJScreenW;
    CGFloat retweetH=CGRectGetMaxY(_retweetTextFrame)+HJStatusCellMargin;
    _retweetViewFrame=CGRectMake(retweetX, retweetY, retweetW, retweetH);
}



@end
