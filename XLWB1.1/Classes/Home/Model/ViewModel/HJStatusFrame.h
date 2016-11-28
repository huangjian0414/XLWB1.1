//
//  HJStatusFrame.h
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/25.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HJStatus;
@interface HJStatusFrame : UIView
/**
 *  微博数据
 */
@property (nonatomic,strong)HJStatus *status;
/**
 *  原创微博frame
 */
@property (nonatomic,assign)CGRect originalViewFrame;
/**原创微博子控件
 *  头像frame
 */
@property (nonatomic,assign)CGRect originalIconFrame;
/**
 *  昵称frame
 */
@property (nonatomic,assign)CGRect originalNameFrame;
/**
 *  VIPframe
 */
@property (nonatomic,assign)CGRect originalVipFrame;
/**
 *  时间frame
 */
@property (nonatomic,assign)CGRect originalTimeFrame;
/**
 *  来源frame
 */
@property (nonatomic,assign)CGRect originalSourceFrame;
/**
 *  正文frame
 */
@property (nonatomic,assign)CGRect originalTextFrame;
/**
 *  转发微博frame
 */
@property (nonatomic,assign)CGRect retweetViewFrame;
/**转发微博子控件
 *  昵称frame
 */
@property (nonatomic,assign)CGRect retweetNameFrame;
/**
 *  正文frame
 */
@property (nonatomic,assign)CGRect retweetTextFrame;

/**
 *  工具条frame
 */
@property (nonatomic,assign)CGRect toolBarViewFrame;

/**
 *  cell的高度
 */
@property (nonatomic,assign)CGFloat cellHeight;

@end
