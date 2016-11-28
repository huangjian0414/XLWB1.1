//
//  HJTabbarButton.m
//  心浪微勃
//
//  Created by geekgourp-1 on 16/8/2.
//  Copyright (c) 2016年 geekgourp-1. All rights reserved.
//

#import "HJTabbarButton.h"
#import "HJBadgeButton.h"

#define ImageScale 0.7

@interface HJTabbarButton()
@property (nonatomic,strong)HJBadgeButton *badgeBtn;

@end
@implementation HJTabbarButton

-(HJBadgeButton *)badgeBtn
{
    if (_badgeBtn==nil) {
        _badgeBtn=[HJBadgeButton buttonWithType:UIButtonTypeCustom];
        
        [self addSubview:_badgeBtn];
    }
    return _badgeBtn;
    
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        self.titleLabel.font=[UIFont systemFontOfSize:12];
        self.imageView.contentMode=UIViewContentModeCenter;
        
    }
    return self;
}


-(void)setItem:(UITabBarItem *)item
{
    _item=item;
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    
    // KVO：时刻监听一个对象的属性有没有改变
    // 给谁添加观察者
    // Observer:按钮
    [item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew context:nil];
//    [self setTitle:_item.title forState:UIControlStateNormal];
//    [self setTitle:_item.title forState:UIControlStateSelected];
//    
//    [self setImage:_item.image forState:UIControlStateNormal];
//    [self setImage:_item.selectedImage forState:UIControlStateSelected];
//    
//    self.badgeBtn.badgeValue=_item.badgeValue;
    
    
    
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    [self setTitle:_item.title forState:UIControlStateNormal];

    [self setImage:_item.image forState:UIControlStateNormal];
    
    [self setImage:_item.selectedImage forState:UIControlStateSelected];
    
    // 设置badgeValue
    self.badgeBtn.badgeValue = _item.badgeValue;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat imageX=0;
    CGFloat imageY=0;
    CGFloat imageW=self.bounds.size.width;
    CGFloat imageH=self.bounds.size.height*ImageScale;
    self.imageView.frame=CGRectMake(imageX, imageY, imageW, imageH);
    
    CGFloat titleX=0;
    CGFloat titleY=CGRectGetMaxY(self.imageView.frame);
    CGFloat titleW=self.bounds.size.width;
    CGFloat titleH=self.bounds.size.height-titleY;
    self.titleLabel.frame=CGRectMake(titleX, titleY, titleW, titleH);
    
    CGFloat badgeBtnX = self.bounds.size.width - self.badgeBtn.bounds.size.width-10;
    CGFloat badgeBtnY = 0;
    
    self.badgeBtn.frame = CGRectMake(badgeBtnX, badgeBtnY, self.badgeBtn.bounds.size.width, self.badgeBtn.bounds.size.height);

}




-(void)setHighlighted:(BOOL)highlighted
{}
@end
