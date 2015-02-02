//
//  SearchMainSectionView.m
//  igo
//
//  Created by DingYunYu on 14/12/29.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "SearchMainSectionView.h"

@interface SearchMainSectionView ()

@property (strong, nonatomic) IBOutlet UIImageView *itemImageView;
@property (strong, nonatomic) IBOutlet UILabel *itemTitle;
@property (weak, nonatomic) SearchRecommendModel *model;
@property (assign, nonatomic) int index;

@end

@implementation SearchMainSectionView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.itemImageView.layer.cornerRadius = 5;
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapsSection:)];
    [self addGestureRecognizer:recognizer];
}

- (void)fillSearchMainSectionWithModel:(SearchRecommendModel *)model index:(int)index
{
    self.model = model;
    self.index = index;
    self.itemImageView.image = [UIImage imageNamed:model.itemImageURL];
    self.itemTitle.text  = model.itemtTitle;
}

#pragma mark 单击tapsSection
- (void)tapsSection:(id)sender
{
    [self.delegate tapSearchMainSectionView:self.model index:self.index];
}

#pragma mark 单击详情的按钮
- (IBAction)redirectToDetailPage:(id)sender
{
    [self.delegate redirectToDetailPage:self.model];
}

@end
