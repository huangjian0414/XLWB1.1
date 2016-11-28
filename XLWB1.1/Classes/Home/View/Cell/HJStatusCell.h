//
//  HJStatusCell.h
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/25.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HJStatusFrame;
@interface HJStatusCell : UITableViewCell

@property (nonatomic,strong)HJStatusFrame *statusF;

+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
