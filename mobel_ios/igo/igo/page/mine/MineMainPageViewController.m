//
//  MineMainPageViewController.m
//  igo
//
//  Created by DingYunYu on 14/12/22.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "MineMainPageViewController.h"
#import "MineMainPageCell.h"
#import "MineMainPageHeadView.h"
#import "FDDPageRedirect.h"
#import "MineSuggestionViewController.h"

@interface MineMainPageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *minePageTableView;
@property (strong, nonatomic) NSArray *imageDataSource;
@property (strong, nonatomic) NSArray *labelDataSource;
@property (strong, nonatomic) NSArray *deepDataSource;

@end

@implementation MineMainPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setCustomTitleLabel:@"YY的小可"];
    
    self.minePageTableView.backgroundColor = FDDKConvertColorBy0xHexRGB(0xE8E8E8);
    self.imageDataSource = @[@"mine_favourite_icon",@"mine_message_icon",@"mine_suggest_icon",@"mine_score_icon"];
    self.labelDataSource = @[@"我的收藏",@"信息",@"意见反馈",@"评分"];
    self.deepDataSource = @[@"1",@"1",@"1",@"0"];
    
    UINib *mineCellNib = [UINib nibWithNibName:@"MineMainPageCell" bundle:nil];
    [self.minePageTableView registerNib:mineCellNib forCellReuseIdentifier:@"mineMainPageCell"];
    
    [self createHeadView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 头部
- (void)createHeadView
{
    MineMainPageHeadView *headView = FDDKLoadViewByNibName(@"MineMainPageHeadView");
    self.minePageTableView.tableHeaderView = headView;
}

#pragma mark TableView的代理和数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.imageDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MineMainPageCell *mineCell = [tableView dequeueReusableCellWithIdentifier:@"mineMainPageCell" forIndexPath:indexPath];
    mineCell.selectionStyle = UITableViewCellSelectionStyleNone;
    [mineCell fillCellContentWith:[self.imageDataSource objectAtIndex:indexPath.row]
                       labelTitle:[self.labelDataSource objectAtIndex:indexPath.row]
                             deep:[[self.deepDataSource objectAtIndex:indexPath.row] intValue]];
    return mineCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [FDDPageRedirect redirectToMyFavoriteViewController:self];
            break;
        case 1:
            [FDDPageRedirect redirectToMyMessageViewController:self];
            break;
        case 2:
            [FDDPageRedirect redirectToSuggestionViewController:self];
            break;
        case 3:
            [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=807031426"]];
            break;
        default:
            break;
    }
}

@end
