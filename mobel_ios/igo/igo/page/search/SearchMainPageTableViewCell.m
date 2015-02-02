//
//  SearchMainPageTableViewCell.m
//  igo
//
//  Created by DingYunYu on 14/12/29.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "SearchMainPageTableViewCell.h"

@interface SearchMainPageTableViewCell ()

@property (strong, nonatomic) IBOutlet UILabel *itemTitlelabel;

@end

@implementation SearchMainPageTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fillSearchMainPageCellWith:(NSString *)title
{
    self.itemTitlelabel.text = title;
}

@end
