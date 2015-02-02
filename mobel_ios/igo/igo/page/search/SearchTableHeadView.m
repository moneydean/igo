//
//  SearchTableHeadView.m
//  igo
//
//  Created by DingYunYu on 14/12/31.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "SearchTableHeadView.h"

@interface SearchTableHeadView ()

@property (strong, nonatomic) IBOutlet UIImageView *searchHeadImageView;
@property (strong, nonatomic) IBOutlet UILabel *searchHeadLabel;

@end

@implementation SearchTableHeadView

- (void)awakeFromNib
{
    
}

- (void)fillViewWithImageURL:(NSString *)urlString headLabel:(NSString *)headLabel
{
    self.searchHeadImageView.image = [UIImage imageNamed:urlString];
    self.searchHeadLabel.text = headLabel;
}

@end
