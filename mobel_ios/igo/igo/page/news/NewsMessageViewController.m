//
//  NewsMessageViewController.m
//  igo
//
//  Created by DingYunYu on 14/12/25.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "NewsMessageViewController.h"

@interface NewsMessageViewController ()

@end

@implementation NewsMessageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setCustomTitleLabel:@"新闻资讯"];
    [self setCustomLeftBtnWithImageName:FDDC_IMAGE_NAV_BACK];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
