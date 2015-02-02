//
//  SingleItemHeadView.m
//  igo
//
//  Created by DingYunYu on 15/1/12.
//  Copyright (c) 2015年 DingYunYu. All rights reserved.
//

#import "SingleItemHeadView.h"

@interface SingleItemHeadView ()

@property (strong, nonatomic) IBOutlet UIImageView *itemImageView;
@property (strong, nonatomic) IBOutlet UILabel *itemLabel;
@property (strong, nonatomic) IBOutlet UIButton *brandBtn;
@property (strong, nonatomic) IBOutlet UIButton *buyBtn;

@end

@implementation SingleItemHeadView

- (void)fillHeadViewWith:(NSString *)imageURL
                itemDesc:(NSString *)itemDesc
                   brand:(NSString *)brand
{
    self.itemImageView.image = [UIImage imageNamed:imageURL];
    self.itemLabel.text = itemDesc;
    [self.brandBtn setTitle:brand forState:UIControlStateNormal];
}

@end
