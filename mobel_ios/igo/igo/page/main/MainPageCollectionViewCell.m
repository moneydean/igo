//
//  UICollectionViewWaterfallCell.m
//  Demo
//
//  Created by Nelson on 12/11/27.
//  Copyright (c) 2012年 Nelson. All rights reserved.
//

#import "MainPageCollectionViewCell.h"

@interface MainPageCollectionViewCell ()

@property (strong, nonatomic) UIImageView *itemImageView;
@property (strong, nonatomic) UIButton *favoriteBtn;
@property (strong, nonatomic) UIImageView *favoriteImageView;
@property (strong, nonatomic) UILabel *favoriteCountLabel;
@property (strong, nonatomic) UILabel *itemSummaryLabel;
@property (strong, nonatomic) UIView *bgView;
@property (weak, nonatomic) CommonItemModel *model;

@end

@implementation MainPageCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    
        [self createImageView];
        [self createTransparencyBgView];
        [self createFavoriteCountLabel];
        [self createSummaryLabel];
        [self createFavoriteImageView];
        [self createFavoriteBtn];
        self.contentView.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

#pragma mark 创建ImageView
- (void)createImageView
{
    self.itemImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0.f, CGRectGetMaxX(self.contentView.bounds), CGRectGetMaxY(self.contentView.bounds))];
    //设置各种属性
    self.itemImageView.contentMode = UIViewContentModeScaleToFill;
    self.itemImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.itemImageView.clipsToBounds = YES;
    //修改imageView的圆角
    self.itemImageView.layer.cornerRadius = 8;
    //添加点击事件
    self.itemImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchItem:)];
    [self.itemImageView addGestureRecognizer:singleTap];
    
    [self.contentView addSubview:self.itemImageView];
}

#pragma mark 创建透明的白底
- (void)createTransparencyBgView
{
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.contentView.bounds) - 30, CGRectGetMaxX(self.contentView.bounds), 30)];
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.bgView.alpha = 0.5;
    [self.contentView addSubview:self.bgView];
}

#pragma mark 创建收藏数量Label
- (void)createFavoriteCountLabel
{
    self.favoriteCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.contentView.bounds) - 30, 25, 30)];
    self.favoriteCountLabel.textColor = FDDKConvertColorBy0xHexRGB(0x403E3F);
    [self.favoriteCountLabel setFont:[UIFont systemFontOfSize:10]];
    [self.favoriteCountLabel setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:self.favoriteCountLabel];
}

#pragma mark 创建收藏按钮的图片
- (void)createFavoriteImageView
{
    self.favoriteImageView = [[UIImageView alloc] initWithFrame:CGRectMake(6, CGRectGetMaxY(self.contentView.bounds) - 20, 11, 10)];
    self.favoriteImageView.image = [UIImage imageNamed:@"home_heart"];
    [self.contentView addSubview:self.favoriteImageView];
}

#pragma mark 创建收藏按钮
- (void)createFavoriteBtn
{
    self.favoriteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.favoriteBtn.frame = CGRectMake(0, CGRectGetMaxY(self.contentView.bounds) - 50, 90, 50);
    [self.favoriteBtn addTarget:self action:@selector(favoriteOrCancelItem:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.favoriteBtn];
}

#pragma mark 创建简介的Label
- (void)createSummaryLabel
{
    self.itemSummaryLabel = [[UILabel alloc] initWithFrame:CGRectMake(48, CGRectGetMaxY(self.contentView.bounds) - 30, CGRectGetMaxX(self.contentView.bounds) - 48, 30)];
    self.itemSummaryLabel.textColor = FDDKConvertColorBy0xHexRGB(0x403E3F);
    [self.itemSummaryLabel setFont:[UIFont systemFontOfSize:10]];
    [self.itemSummaryLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.itemSummaryLabel setNumberOfLines:0];
    [self.itemSummaryLabel setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:self.itemSummaryLabel];
}

- (void)drawRect:(CGRect)rect
{
    self.bgView.frame = CGRectMake(0, CGRectGetMaxY(self.contentView.bounds) - 30, CGRectGetMaxX(self.contentView.bounds), 30);
    self.favoriteCountLabel.frame = CGRectMake(20, CGRectGetMaxY(self.contentView.bounds) - 30, 25, 30);
    self.favoriteImageView.frame = CGRectMake(6, CGRectGetMaxY(self.contentView.bounds) - 20, 11, 10);
    self.favoriteBtn.frame = CGRectMake(0, CGRectGetMaxY(self.contentView.bounds) - 50, 90, 50);
    self.itemSummaryLabel.frame = CGRectMake(48, CGRectGetMaxY(self.contentView.bounds) - 30, CGRectGetMaxX(self.contentView.bounds) - 48, 30);
}

#pragma mark 填充cell
- (void)fillCellWith:(CommonItemModel *)model
{
    self.model = model;
    self.itemImageView.image = [UIImage imageNamed:self.model.imageURL];
    [self.favoriteCountLabel setText:[NSString stringWithFormat:@"%d",self.model.favoritesCount]];
    [self.itemSummaryLabel setText:self.model.itemSummary];
    [self setNeedsDisplay];
}

#pragma mark 回调函数
- (void)itemFavoriteCallBack:(BOOL)result
{
    if (result) {
        FDDMPrintFunctionName();
    }
}

#pragma mark 收藏或者取消收藏
- (void)favoriteOrCancelItem:(id)sender
{
    if (self.delegate) {
        [self.delegate itemFavoriteClick:self.model cell:self];
    }
}

#pragma mark 点击物品
- (void)touchItem:(id)sender
{
    if (self.delegate) {
        [self.delegate itemImageViewClick:self.model];
    }
}

@end
