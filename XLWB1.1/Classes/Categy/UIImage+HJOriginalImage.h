//
//  UIImage+HJOriginalImage.h
//  心浪微勃
//
//  Created by geekgourp-1 on 16/8/2.
//  Copyright (c) 2016年 geekgourp-1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HJOriginalImage)
+ (UIImage *)originalImageIgnoredRenderWithImageName:(NSString *)imageName;

+(UIImage *)stretchableImageWithName:(NSString *)imageName;
@end
