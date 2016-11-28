//
//  HJStatusCell.m
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/25.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import "HJStatusCell.h"
#import "HJOriginalView.h"
#import "HJRetweetView.h"
#import "HJStatusToolBar.h"
#import "HJStatusFrame.h"


@interface HJStatusCell ()
@property (nonatomic,weak)HJOriginalView *originalView;
@property (nonatomic,weak)HJRetweetView *retweetView;
@property (nonatomic,weak)HJStatusToolBar *toolBar;



@end

@implementation HJStatusCell


//cell时用initwithstyle初始化
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //添加所有子空间
        [self setUpAllChildView];
        
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}


-(void)setUpAllChildView
{
    HJOriginalView *originalView=[[HJOriginalView alloc]init];
    [self addSubview:originalView];
    self.originalView=originalView;
    
    HJRetweetView *retweetView=[[HJRetweetView alloc]init];
    [self addSubview:retweetView];
    self.retweetView=retweetView;
    
    HJStatusToolBar *toolBar=[[HJStatusToolBar alloc]init];
    [self addSubview:toolBar];
    self.toolBar=toolBar;

    
}
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    
    static NSString *ID=@"home";
    id cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell=[[self alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
    }
    
    return cell;
    
}

/*
 cell的高度应该提前计算出来
 cell的高度要先计算出每个子控件的frame，才能确定
 如果在cell的setstatus方法计算子空间的位置，会比较耗性能
 
 MVVM思想
 
 VM:模型包装成视图模型  模型＋模型对应视图的frame
 
 */

-(void)setStatusF:(HJStatusFrame *)statusF
{
    _statusF=statusF;
    //设置原创微博的frame
    _originalView.frame=statusF.originalViewFrame;
    _originalView.statusF=statusF;
    //设置转发微博的frame
    _retweetView.frame=statusF.retweetViewFrame;
    _retweetView.statusF=statusF;
    //设置工具条的frame
    _toolBar.frame=statusF.toolBarViewFrame;
}



@end
