//
//  ItemColloactionCollectionViewCell.m
//  igo
//
//  Created by DingYunYu on 14/12/31.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "ItemColloactionCollectionViewCell.h"

@interface ItemColloactionCollectionViewCell ()

@property (strong, nonatomic) UILabel *priceLabel;
@property (strong, nonatomic) UILabel *channelLabel;

@end

@implementation ItemColloactionCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self createBorderImageView];
        [self createItemImageView];
        [self createBottomView];
        [self createPriceLabel];
        [self createChannelImageView];
        [self createChannelLabel];
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 5;
    }
    return self;
}

#pragma mark 创建边框
- (void)createBorderImageView
{
    UIImageView *borderImageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    borderImageView.image = [UIImage imageNamed:@"demo_round_rect"];
    [self.contentView addSubview:borderImageView];
}

#pragma mark 创建衣服
- (void)createItemImageView
{
    UIImageView *itemImageView = [[UIImageView alloc] initWithFrame:CGRectMake(1, 1, 148, 153)];
    itemImageView.image = [UIImage imageNamed:@"demo_channel"];
    [self.contentView addSubview:itemImageView];
}

#pragma mark 创建文字view
- (void)createBottomView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 155, 150, 29)];
    view.backgroundColor = FDDKConvertColorBy0xHexRGB(0xEFEFEF);
    [self.contentView addSubview:view];
}

#pragma mark 创建价格
- (void)createPriceLabel
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(8, 155, 82, 21)];
    label.backgroundColor = [UIColor clearColor];
    [label setTextColor:FDDKConvertColorBy0xHexRGB(0xD53034)];
    [label setFont:[UIFont systemFontOfSize:12]];
    [self.contentView addSubview:label];
    self.priceLabel = label;
}

#pragma mark 创建渠道view
- (void)createChannelImageView
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(97, 160, 40, 15)];
    imageView.image = [UIImage imageNamed:@"search_channel"];
    [self.contentView addSubview:imageView];
}

#pragma mark 创建渠道label
- (void)createChannelLabel
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(115, 163, 30, 11)];
    label.backgroundColor = [UIColor clearColor];
    [label setTextColor:FDDKConvertColorBy0xHexRGB(0xFFFFFF)];
    [label setFont:[UIFont systemFontOfSize:9]];
    [self.contentView addSubview:label];
    self.channelLabel = label;
}

- (void)fillItemWithChannel:(NSString *)channel price:(float)price
{
    self.priceLabel.text = [NSString stringWithFormat:@"￥%.2f",price];
    self.channelLabel.text = channel;
}

@end
