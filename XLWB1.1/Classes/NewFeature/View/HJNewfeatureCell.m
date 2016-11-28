//
//  HJNewfeatureCell.m
//  心浪微勃
//
//  Created by geekgourp-1 on 16/8/10.
//  Copyright (c) 2016年 geekgourp-1. All rights reserved.
//

#import "HJNewfeatureCell.h"
#import "HJTabbarVC.h"
#import "HJNewModel.h"

@interface HJNewfeatureCell()
@property (nonatomic,weak)UIImageView *imageView;

@property (nonatomic,strong)UIButton *startBtn;

@property (nonatomic,strong)UIButton *checkBtn;


@end

@implementation HJNewfeatureCell



-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        UIImageView *imageView=[[UIImageView alloc]init];
        [self.contentView addSubview:imageView];
        self.imageView=imageView;
        self.imageView.userInteractionEnabled=YES;
    }
    return self;
}

-(UIButton *)startBtn
{
    if (_startBtn==nil) {
        _startBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [_startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
         [_startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
        [_startBtn setTitle:@"开始微博" forState:UIControlStateNormal];
        _startBtn.titleLabel.font=[UIFont systemFontOfSize:20];
        [_startBtn sizeToFit];
        
        [_startBtn addTarget:self action:@selector(onClickStartBtn) forControlEvents:UIControlEventTouchUpInside];
        [self.imageView addSubview:_startBtn];
        
        
    }
    
    return _startBtn;
}

-(UIButton *)checkBtn
{
    if (_checkBtn==nil) {
         _checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _checkBtn.selected=YES;
         [_checkBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
        [_checkBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
        [_checkBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
        [_checkBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        [_checkBtn addTarget:self action:@selector(onClickCheckBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [_checkBtn sizeToFit];
       
        [self.imageView addSubview:_checkBtn];
    }
    
    
    return _checkBtn;
}
//布局
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame=[UIScreen mainScreen].bounds;
    
    self.startBtn.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height*0.8);
    
    self.checkBtn.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height*0.9);
    
}

-(void)setModel:(HJNewModel *)model
{
    _model=model;
    
    self.imageView.image=_model.image;
    if (_model.indexPath.item==_model.count-1) {
        self.startBtn.hidden = NO;
        self.checkBtn.hidden = NO;
    }else
    {
        self.startBtn.hidden = YES;
        self.checkBtn.hidden = YES;
    }
    
}



-(void)onClickStartBtn
{
    HJTabbarVC *vc=[[HJTabbarVC alloc]init];
    self.window.rootViewController=vc;
    
}

-(void)onClickCheckBtn:(UIButton *)checkBtn
{
    self.checkBtn.selected=!self.checkBtn.selected;
}

@end
