//
//  AppDelegate.m
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/16.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import "AppDelegate.h"
#import "HJTabbarVC.h"
#import "HJNewFeatureVC.h"
#import "HJOAuthVC.h"
#import "HJAccountTool.h"
#import "HJRootTool.h"
#import "UIImageView+WebCache.h"
#import <AVFoundation/AVFoundation.h>

@interface AppDelegate ()

@property (nonatomic,strong)AVAudioPlayer *player;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIUserNotificationSettings *setting=[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    
    [application registerUserNotificationSettings:setting];
    
    
    //真机上后台播放，设置音频会话
    AVAudioSession *session=[AVAudioSession sharedInstance];
    //后台播放
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    //激活
    [session setActive:YES error:nil];
    
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    if ([HJAccountTool account]) {
        [HJRootTool chooseRootViewController:self.window];
    }else
    {
        HJOAuthVC *oauthVc=[[HJOAuthVC alloc]init];
        self.window.rootViewController=oauthVc;
        
    }
    [self.window makeKeyAndVisible];
    return YES;
}


//收到内存警告时调用
-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    //停止所有下载
    [[SDWebImageManager sharedManager]cancelAll];
    
    //删除缓存
    [[SDWebImageManager sharedManager].imageCache clearMemory];
    
}

//程序失去焦点
- (void)applicationWillResignActive:(UIApplication *)application {
    NSURL *url=[[NSBundle mainBundle]URLForResource:@"silence.mp3" withExtension:nil];
    AVAudioPlayer *player=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    [player prepareToPlay];
    player.numberOfLoops=-1;
    [player play];
    
    _player=player;
    
}

//程序进入后调用
- (void)applicationDidEnterBackground:(UIApplication *)application {
   
    //开启一个后台任务，时间不稳定，优先级低，假如系统要关闭应用，首先考虑
    UIBackgroundTaskIdentifier ID= [application beginBackgroundTaskWithExpirationHandler:^{
       //后台任务结束时调用
        [application endBackgroundTask:ID];
        
    }];
    
    //欺骗苹果，提高优先级
    //苹果会检测你呦没有播放音乐，没有可能就干掉了
    //微博：播放0kb 静音音乐
    
    
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
