//
//  UIImage+HJOriginalImage.m
//  心浪微勃
//
//  Created by geekgourp-1 on 16/8/2.
//  Copyright (c) 2016年 geekgourp-1. All rights reserved.
//

#import "UIImage+HJOriginalImage.h"

@implementation UIImage (HJOriginalImage)


+ (UIImage *)originalImageIgnoredRenderWithImageName:(NSString *)imageName
{
    UIImage *image=[UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:1];
}

+(UIImage *)stretchableImageWithName:(NSString *)imageName
{
    UIImage *image=[UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
@end
