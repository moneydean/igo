//
//  UICollectionViewWaterfallCell.h
//  Demo
//
//  Created by Nelson on 12/11/27.
//  Copyright (c) 2012年 Nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonItemModel.h"

@protocol ItemControlDelegate;

@interface MainPageCollectionViewCell : UICollectionViewCell

@property (assign, nonatomic) id<ItemControlDelegate> delegate;

#pragma mark 填充cell
- (void)fillCellWith:(CommonItemModel *)model;

#pragma mark 回调函数
- (void)itemFavoriteCallBack:(BOOL)result;

@end

@protocol ItemControlDelegate <NSObject>

@optional
- (void)itemImageViewClick:(CommonItemModel *)model;
- (void)itemFavoriteClick:(CommonItemModel *)model cell:(MainPageCollectionViewCell *)cell;

@end