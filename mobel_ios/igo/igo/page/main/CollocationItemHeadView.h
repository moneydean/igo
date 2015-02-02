//
//  CollocationItemHeadView.h
//  igo
//
//  Created by DingYunYu on 15/1/6.
//  Copyright (c) 2015年 DingYunYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CollocationItemClickDelegate;

@interface CollocationItemHeadView : UICollectionReusableView

@property (weak, nonatomic) id<CollocationItemClickDelegate> delegate;

- (void)fillItemScrollView:(NSMutableArray *)itemArray topImage:(NSString *)topImage;

@end

@protocol CollocationItemClickDelegate

@optional
- (void)clickCollocationItem;
- (void)clickLastCollocationImageView;

@end
