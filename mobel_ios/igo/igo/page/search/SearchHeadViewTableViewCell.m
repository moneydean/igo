//
//  SearchHeadViewTableViewCell.m
//  igo
//
//  Created by DingYunYu on 14/12/29.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "SearchHeadViewTableViewCell.h"

@interface SearchHeadViewTableViewCell ()

@property (strong, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation SearchHeadViewTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fillCellWith:(NSString *)detailTitle
{
    self.detailLabel.text = detailTitle;
}

@end
