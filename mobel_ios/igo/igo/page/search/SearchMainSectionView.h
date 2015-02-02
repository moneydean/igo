//
//  SearchMainSectionView.h
//  igo
//
//  Created by DingYunYu on 14/12/29.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchRecommendModel.h"

@protocol SearchMainSectionTapDelegate;

@interface SearchMainSectionView : UIView

@property (weak, nonatomic) id<SearchMainSectionTapDelegate>delegate;

- (void)fillSearchMainSectionWithModel:(SearchRecommendModel *)model index:(int)index;

@end

@protocol SearchMainSectionTapDelegate <NSObject>

@optional
- (void)tapSearchMainSectionView:(SearchRecommendModel *)model index:(int)index;
- (void)redirectToDetailPage:(SearchRecommendModel *)model;

@end
