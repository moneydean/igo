//
//  MyMessageCell.m
//  igo
//
//  Created by DingYunYu on 14/12/23.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "MyMessageCell.h"
#import "FDDUtils.h"

@interface MyMessageCell ()

@property (strong, nonatomic) IBOutlet UIImageView *messageImageView;
@property (strong, nonatomic) IBOutlet UILabel *messageLabel;
@property (strong, nonatomic) IBOutlet UILabel *messageTimeLabel;

@end

@implementation MyMessageCell

- (void)awakeFromNib
{
    // Initialization code
    self.messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.messageLabel.numberOfLines = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fillCellContentWithModel:(MineMessageModel *)model
{
    self.messageImageView.image = [UIImage imageNamed:model.imageURL];
    self.messageLabel.text = model.title;
    self.messageTimeLabel.text = [FDDUtils timeIntervalToTimeString:@"MM-dd" time:[model.date timeIntervalSince1970]];
}

@end
