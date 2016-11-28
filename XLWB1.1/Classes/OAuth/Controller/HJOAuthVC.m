//
//  HJOAuthVC.m
//  心浪微勃
//
//  Created by geekgourp-1 on 16/8/12.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import "HJOAuthVC.h"
#import "MBProgressHUD+CZ.h"
#import "AFNetworking.h"
#import "HJAccount.h"
#import "HJAccountTool.h"
#import "HJRootTool.h"


#define HJBaseUrl @"https://api.weibo.com/oauth2/authorize"
#define HJClient_id @"1769510173"
#define HJRedirect_uri @"http://www.baidu.com"
#define HJClient_secret @"7f3f14b511e11adab16d0874e268efb2"


@interface HJOAuthVC ()<UIWebViewDelegate>

@end

@implementation HJOAuthVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView=[[UIWebView alloc]initWithFrame:self.view.bounds];
    
    NSString *urlStr=[NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@",HJBaseUrl,HJClient_id,HJRedirect_uri];
    NSURL *url=[NSURL URLWithString:urlStr];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    webView.delegate=self;
    
    [self.view addSubview:webView];
    
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlStr=request.URL.absoluteString;
    NSRange range=[urlStr rangeOfString:@"code="];
    if (range.length) {
        NSString *code=[urlStr substringFromIndex:range.location+range.length];
        [self accessTokenWithCode:code];
        return NO;
    }
    

    return YES;
}
/*
 client_id 	true 	string 	申请应用时分配的AppKey。
 client_secret 	true 	string 	申请应用时分配的AppSecret。
 grant_type 	true 	string 	请求的类型，填写authorization_code
 grant_type为authorization_code时
 必选 	类型及范围 	说明
 code 	true 	string 	调用authorize获得的code值。
 redirect_uri 	true 	string 	回调地址，需需与注册应用里的回调地址一致。
 */

-(void)accessTokenWithCode:(NSString *)code
{
    
     [HJAccountTool accountWithCode:code success:^{
         
         [HJRootTool chooseRootViewController:[UIApplication sharedApplication].keyWindow];

     } failure:^(NSError *error) {
         
     }];
        
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUD];
    
}


-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showMessage:@"正在加载...."];

}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];
}
@end
