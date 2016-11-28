//
//  HJStatus.m
//  心浪微勃1.1
//
//  Created by geekgourp-1 on 16/8/17.
//  Copyright © 2016年 geekgourp-1. All rights reserved.
//

#import "HJStatus.h"
#import "HJPhotos.h"
#import "NSDate+MJ.h"
@implementation HJStatus



/**
 *  数组中需要转换的模型类
 *
 *  @return 字典中的key是数组属性名，value是数组中存放模型的Class
 */
//自动把数组中的字典转换成对应的模型

+(NSDictionary *)objectClassInArray
{
    
    return @{@"pic_urls":[HJPhotos class]};
}

-(NSString *)created_at
{
    //字符串转NSDate
    //日期格式字符串
    NSDateFormatter *fmt=[[NSDateFormatter alloc]init];
    fmt.dateFormat=@"EEE MMM d HH:mm:ss Z yyyy";
    //必须设置， 模拟器，真机中文解析不出
    fmt.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
    NSDate *created_at=[fmt dateFromString:_created_at];
    
    if ([created_at isThisYear]) {//今年
        if ([created_at isToday]) {//今天
            //计算根当前时间差距
            NSDateComponents *cmp=[created_at deltaWithNow];
            if (cmp.hour>=1) {
                return [NSString stringWithFormat:@"%ld小时之前",cmp.hour];
            }else if(cmp.minute>1){
            
                return [NSString stringWithFormat:@"%ld分钟之前",cmp.minute];
            }else
            {
                return @"刚刚";
            }
            
            
        }else if([created_at isYesterday])//昨天
        {
            fmt.dateFormat=@"昨天 HH:mm";
            return [fmt stringFromDate:created_at];
        }else//前天
        {
            fmt.dateFormat=@"MM-dd HH:mm";
            return [fmt stringFromDate:created_at];
        }
        
    }else//不是今年
    {
        fmt.dateFormat=@"yyyy-MM-dd HH:mm";
        return [fmt stringFromDate:created_at];
    }
    
    return _created_at;
}
-(void)setSource:(NSString *)source
{
    NSRange range=[source rangeOfString:@">"];
    source=[source substringFromIndex:range.location+range.length];
    range=[source rangeOfString:@"<"];
    source=[source substringToIndex:range.location];
    source=[NSString stringWithFormat:@"来自%@",source];
    
    
    _source=source;
    
}
-(void)setRetweeted_status:(HJStatus *)retweeted_status
{
    _retweeted_status=retweeted_status;
    _retweetName=[NSString stringWithFormat:@"@%@",retweeted_status.user.name];
    
}


@end
