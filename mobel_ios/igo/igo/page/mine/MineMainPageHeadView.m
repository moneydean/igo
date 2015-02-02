//
//  MineMainPageHeadView.m
//  igo
//
//  Created by DingYunYu on 14/12/22.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "MineMainPageHeadView.h"

@interface MineMainPageHeadView ()

@property (strong, nonatomic) IBOutlet UIImageView *headIconView;

@end

@implementation MineMainPageHeadView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.headIconView.layer.cornerRadius = 60;
}

@end
