//
//  HJTabbar.m
//  心浪微勃
//
//  Created by geekgourp-1 on 16/8/2.
//  Copyright (c) 2016年 geekgourp-1. All rights reserved.
//

#import "HJTabbar.h"
#import "HJTabbarButton.h"

@interface HJTabbar()

@property (nonatomic,weak)UIButton *addBtn;


@property (nonatomic,strong)NSMutableArray *buttonsArr;

@property (nonatomic,strong)HJTabbarButton *selectedBtn;
@end

@implementation HJTabbar

-(NSMutableArray *)buttonsArr
{
    if (_buttonsArr==nil) {
        _buttonsArr=[NSMutableArray array];
    }
    return _buttonsArr;
}




-(UIButton *)addBtn
{
    
    if (_addBtn==nil) {
        UIButton *addBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [addBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [addBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        [addBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [addBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [self addSubview:addBtn];
        //btn 的size自适应图片
        [addBtn sizeToFit];
        
        _addBtn=addBtn;
    }
    return _addBtn;
    
    
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background"]];
    }
    return self;
}


-(void)setItems:(NSArray *)items
{
    _items=items;
    for (UITabBarItem *item in _items) {
        HJTabbarButton *btn=[HJTabbarButton buttonWithType:UIButtonTypeCustom];
        btn.item=item;
        btn.tag=self.buttonsArr.count;
        [self addSubview:btn];
        [self.buttonsArr addObject:btn];
        
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchDown];
        
        if (btn.tag==0) {
            [self clickBtn:btn];
        }
        
    }
}

-(void)clickBtn:(HJTabbarButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(hjTabbar:SelectedBtnIndex:)]) {
        [self.delegate hjTabbar:self SelectedBtnIndex:btn.tag];
    }
    self.selectedBtn.selected=NO;
    btn.selected=YES;
    self.selectedBtn=btn;
    
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat itemX=0;
    CGFloat itemY=0;
    CGFloat itemW=self.bounds.size.width/(self.buttonsArr.count+1);
    CGFloat itemH=self.bounds.size.height;
    int i=0;
    for (HJTabbarButton *btn in self.buttonsArr) {
        if (i==2) {
            i++;
        }
        itemX=i*itemW;
        btn.frame=CGRectMake(itemX, itemY, itemW, itemH);
        i++;
    }
    self.addBtn.center=CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
}





@end
