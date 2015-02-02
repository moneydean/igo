//
//  MineMainPageCell.m
//  igo
//
//  Created by DingYunYu on 14/12/22.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "MineMainPageCell.h"

@interface MineMainPageCell ()

@property (strong, nonatomic) IBOutlet UIImageView *cellIconImageView;
@property (strong, nonatomic) IBOutlet UILabel *cellLabelView;
@property (strong, nonatomic) IBOutlet UIImageView *cellDeepImageView;

@end

@implementation MineMainPageCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.contentView.backgroundColor = FDDKConvertColorBy0xHexRGB(0xE8E8E8);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)fillCellContentWith:(NSString *)imageName labelTitle:(NSString *)labelTitle deep:(BOOL)deep
{
    self.cellIconImageView.image = [UIImage imageNamed:imageName];
    self.cellLabelView.text = labelTitle;
    self.cellDeepImageView.hidden = !deep;
}

@end
