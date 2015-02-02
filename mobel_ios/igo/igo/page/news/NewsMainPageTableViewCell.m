//
//  NewsMainPageTableViewCell.m
//  igo
//
//  Created by DingYunYu on 14/12/25.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "NewsMainPageTableViewCell.h"

@interface NewsMainPageTableViewCell ()

@property (strong, nonatomic) IBOutlet UIImageView *newsImageView;
@property (strong, nonatomic) IBOutlet UILabel *newsTitle;

@end

@implementation NewsMainPageTableViewCell

- (void)awakeFromNib
{
    // Initialization code
    self.newsImageView.layer.cornerRadius = 5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fillCellContentWith:(NewsModel *)model
{
    self.newsImageView.image = [UIImage imageNamed:model.imageURL];
    self.newsTitle.text = model.title;
}

@end
