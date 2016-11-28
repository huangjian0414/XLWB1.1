//
//  HJTabbarVC.m
//  心浪微勃
//
//  Created by geekgourp-1 on 16/8/2.
//  Copyright (c) 2016年 geekgourp-1. All rights reserved.
//

#import "HJTabbarVC.h"
#import "UIImage+HJOriginalImage.h"
#import "HJTabbar.h"
#import "HJHomeVC.h"
#import "HJNavigationVC.h"
#import "HJMessageVC.h"
#import "HJProfileVC.h"
#import "HJDiscoverVC.h"

#import "HJUserTool.h"
#import "HJUserResult.h"

#import "HJAccount.h"
#import "HJAccountTool.h"

@interface HJTabbarVC ()<HJTabbarDelegate>

@property (nonatomic,strong)NSMutableArray *items;
@property (nonatomic,weak)HJHomeVC *home;
@property (nonatomic,weak)HJMessageVC *message;
@property (nonatomic,weak)HJProfileVC *profile;




@end

@implementation HJTabbarVC

-(NSMutableArray *)items
{
    if (_items==nil) {
        _items=[NSMutableArray array];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAllChildViewController];
    
    [self setTabBar];
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(requestUnread) userInfo:nil repeats:YES];
    
    
}
-(void)requestUnread
{
    [HJUserTool unreadWithSuccess:^(HJUserResult *result) {
        _home.tabBarItem.badgeValue=[NSString stringWithFormat:@"%d",result.status];
        _message.tabBarItem.badgeValue=[NSString stringWithFormat:@"%d",result.messageCount];
        _profile.tabBarItem.badgeValue=[NSString stringWithFormat:@"%d",result.follower];
        
        [UIApplication sharedApplication].applicationIconBadgeNumber=result.totoalCount;
        
    } failure:^(NSError *error) {
        
    }];

}


-(void)setTabBar
{
    HJTabbar *tabbar=[[HJTabbar alloc]initWithFrame:self.tabBar.frame];
    tabbar.backgroundColor=[UIColor whiteColor];
    tabbar.items=self.items;
    
    [tabbar setDelegate:self];
    
    [self.view addSubview:tabbar];
    [self.tabBar removeFromSuperview];
    
}

//点击tabbar时调用
-(void)hjTabbar:(HJTabbar *)hjTabbar SelectedBtnIndex:(NSInteger)index
{
    if (index==0&&self.selectedIndex==index) {//首页刷新
        [_home refresh];
    }
    self.selectedIndex=index;
    
}


- (void)setupOneChildViewControllerWithViewController:(UIViewController *)hj andNormalImageName:(NSString*)imageName andSelectedImageName:(NSString *)selectedImageName andTitle:(NSString *)title andBadgeValue:(NSString *)badgeValue
{
    hj.tabBarItem.selectedImage=[UIImage originalImageIgnoredRenderWithImageName:selectedImageName];
    hj.tabBarItem.image=[UIImage imageNamed:imageName];
//    hj.tabBarItem.title=title;
//    hj.navigationItem.title=title;
    hj.title=title;
    hj.tabBarItem.badgeValue=badgeValue;
    
    [self.items addObject:hj.tabBarItem];
   
    
    HJNavigationVC *navVc=[[HJNavigationVC alloc]initWithRootViewController:hj];
    
    
     [self addChildViewController:navVc];
    
    
}


-(void)setupAllChildViewController
{
     HJHomeVC *home = [[HJHomeVC alloc] init];
    
    // 1.2 设置首页的UITabBarItem
    
    [self setupOneChildViewControllerWithViewController:home andNormalImageName:@"tabbar_home" andSelectedImageName:@"tabbar_home_selected" andTitle:@"首页" andBadgeValue:nil];
    _home=home;
    
    // 2.消息
    HJMessageVC *message = [[HJMessageVC alloc] init];
    
    [self setupOneChildViewControllerWithViewController:message andNormalImageName:@"tabbar_message_center" andSelectedImageName:@"tabbar_message_center_selected" andTitle:@"消息" andBadgeValue:nil];
    _message=message;
    
    // 3.发现
    HJDiscoverVC *discover = [[HJDiscoverVC alloc] init];
    
    
    
    [self setupOneChildViewControllerWithViewController:discover andNormalImageName:@"tabbar_discover" andSelectedImageName:@"tabbar_discover_selected" andTitle:@"发现" andBadgeValue:nil];
    
    // 4.我
    HJProfileVC *profile = [[HJProfileVC alloc] init];
    
    [self setupOneChildViewControllerWithViewController:profile andNormalImageName:@"tabbar_profile" andSelectedImageName:@"tabbar_profile_selected" andTitle:@"我" andBadgeValue:nil];
    _profile=profile;
    
    
}

@end
