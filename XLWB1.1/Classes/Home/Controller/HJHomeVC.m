//
//  HJHomeVC.m
//  心浪微勃
//
//  Created by geekgourp-1 on 16/8/6.
//  Copyright (c) 2016年 geekgourp-1. All rights reserved.
//

#import "HJHomeVC.h"
#import "UIBarButtonItem+HJItem.h"
#import "HJTitleBtn.h"
#import "AFNetworking.h"
#import "HJAccountTool.h"
#import "HJAccount.h"
#import "HJStatus.h"
#import "MJExtension.h"
#import "HJUser.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "HJHttpTool.h"
#import "HJStatusTool.h"
#import "HJUserTool.h"

#import "HJStatusCell.h"
#import "HJStatusFrame.h"


@interface HJHomeVC ()
/**
 *  ViewModel :HJStatusFrame
 */
@property (nonatomic,strong)NSMutableArray *statusFrames;

@property (nonatomic,weak)HJTitleBtn *titleBtn;
@end

@implementation HJHomeVC

-(NSMutableArray *)statusFrames
{
    if (_statusFrames==nil) {
        _statusFrames=[NSMutableArray array];
    }
    return _statusFrames;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavgationBar];
    
//    [self loadNewstatus];
    
    //下啦刷新控件
    [self.tableView addHeaderWithTarget:self action:@selector(loadNewstatus)];
    
    
    [self.tableView headerBeginRefreshing];
   
    //上啦
    [self.tableView addFooterWithTarget:self action:@selector(loadMoreStatus)];
    
    self.tableView.backgroundColor=[UIColor lightGrayColor];
    //取消分割线
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
}

-(void)refresh
{
    [self.tableView headerBeginRefreshing];
}

-(void)loadMoreStatus
{
    NSString *maxIdStr=nil;
    if (self.statusFrames.count) {
            HJStatus *s=[self.statusFrames[0]status];
        
            long long maxId=[s.idstr longLongValue]-1;
            maxIdStr=[NSString stringWithFormat:@"%lld",maxId];
        }
    [HJStatusTool moreStatusWithMaxId:maxIdStr success:^(NSArray *statuses) {
        
        [self.tableView footerEndRefreshing];
        
        NSMutableArray *statusFrames=[NSMutableArray array];
        for (HJStatus *status in statuses) {
            HJStatusFrame *statusF=[[HJStatusFrame alloc]init];
            statusF.status=status;
            [statusFrames addObject:statusF];
        }

        
        [self.statusFrames addObjectsFromArray:statusFrames];
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
    
}


-(void)loadNewstatus
{
    NSString *sinceId=nil;
    if (self.statusFrames.count) {
        HJStatus *s=[self.statusFrames[0]status];
        sinceId=s.idstr;
    }
    [HJStatusTool newStatusWithSinceId:sinceId success:^(NSArray *statuses) {
            
        [self showNewStatusCount:statuses.count];
        
        [self.tableView headerEndRefreshing];
        
        //模型转换试图模型 HJStatus->HJStatusFrame
        NSMutableArray *statusFrames=[NSMutableArray array];
        for (HJStatus *status in statuses) {
            HJStatusFrame *statusF=[[HJStatusFrame alloc]init];
            statusF.status=status;
            [statusFrames addObject:statusF];
        }
        
        NSIndexSet *indexSet=[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, statuses.count)];
        [self.statusFrames insertObjects:statusFrames atIndexes:indexSet];
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
        
    }];
}

-(void)showNewStatusCount:(NSUInteger)count
{
    if (count==0) return;
    
    CGFloat h=35;
    CGFloat y=CGRectGetMaxY(self.navigationController.navigationBar.frame)-h;
    CGFloat x=0;
    CGFloat w=self.view.frame.size.width;
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    
    lable.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_new_status_background"]];
    lable.text=[NSString stringWithFormat:@"最新微博数%ld",count];
    lable.textColor=[UIColor whiteColor];
    lable.textAlignment=NSTextAlignmentCenter;
    
    [self.navigationController.view insertSubview:lable belowSubview:self.navigationController.navigationBar];
    
    [UIView animateWithDuration:0.25 animations:^{
        lable.transform=CGAffineTransformMakeTranslation(0, h);
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 delay:2 options:UIViewAnimationOptionCurveLinear animations:^{
            lable.transform=CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
            [lable removeFromSuperview];
        }];
        
        
    }];
    
    
    
}


- (void)setUpNavgationBar
{
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem barBtnItemWithImg:[UIImage imageNamed:@"navigationbar_friendsearch"] highImg:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] target:self action:@selector(friendsearch) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem barBtnItemWithImg:[UIImage imageNamed:@"navigationbar_pop"] highImg:[UIImage imageNamed:@"navigationbar_pop_highlighted"] target:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    
    
    HJTitleBtn *titleBtn=[HJTitleBtn buttonWithType:UIButtonTypeCustom];
    titleBtn.bounds=CGRectMake(0, 0, 200, 44);
    [titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView=titleBtn;
    
    
}
-(void)titleBtnClick:(HJTitleBtn *)titleBtn
{
    if (CGAffineTransformIsIdentity(titleBtn.imageView.transform)) {
        
        titleBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI);
    }
    else
    {
        titleBtn.imageView.transform = CGAffineTransformIdentity;
    }

}



- (void)friendsearch
{

}

- (void)pop
{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.statusFrames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    HJStatusCell *cell=[HJStatusCell cellWithTableView:tableView];

//    HJStatus *status=self.statuses[indexPath.row];
    
    HJStatusFrame *statusF=self.statusFrames[indexPath.row];
    cell.statusF=statusF;
    
    
//    cell.textLabel.text=status.user.name;
//    [cell.imageView sd_setImageWithURL:status.user.profile_image_url placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
//    cell.detailTextLabel.text=status.text;

    return cell;
}
//返回cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HJStatusFrame *statusF=self.statusFrames[indexPath.row];
    
    return statusF.cellHeight;
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [[UIViewController alloc] init];
    
    vc.view.backgroundColor = [UIColor redColor];
    
    [self.navigationController pushViewController:vc
                                         animated:YES];
}



@end
