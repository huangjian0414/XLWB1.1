//
//  HJNewFeatureVC.m
//  心浪微勃
//
//  Created by geekgourp-1 on 16/8/10.
//  Copyright (c) 2016年 geekgourp-1. All rights reserved.
//

#import "HJNewFeatureVC.h"
#import "HJNewfeatureCell.h"
#import "HJNewModel.h"

#define ImageViewCount 4
@interface HJNewFeatureVC ()

@end

@implementation HJNewFeatureVC

static NSString * const reuseIdentifier = @"Cell";


-(instancetype)init
{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize=[UIScreen mainScreen].bounds.size;
    
    layout.minimumLineSpacing=0;
    
    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    
    return [super initWithCollectionViewLayout:layout];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[HJNewfeatureCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.pagingEnabled=YES;
    self.collectionView.bounces=NO;
    
    self.collectionView.showsHorizontalScrollIndicator=NO;
    
    
   }


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return ImageViewCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HJNewfeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    NSString *imageName=[NSString stringWithFormat:@"new_feature_%ld",indexPath.item+1];
    UIImage *image=[UIImage imageNamed:imageName];
    HJNewModel *model=[[HJNewModel alloc]init];
    model.image=image;
    model.indexPath=indexPath;
    model.count=ImageViewCount;
    cell.model=model;
 
    return cell;
}



@end
