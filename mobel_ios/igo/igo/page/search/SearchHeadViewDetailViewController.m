//
//  SearchHeadViewDetailViewController.m
//  igo
//
//  Created by DingYunYu on 14/12/29.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "SearchHeadViewDetailViewController.h"
#import "SearchHeadViewTableViewCell.h"
#import "SearchTableHeadView.h"

@interface SearchHeadViewDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *detailTableView;
@property (strong, nonatomic) NSMutableArray *detailDataSource;
@property (strong, nonatomic) SearchTableHeadView *searchHeadView;

@end

@implementation SearchHeadViewDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setCustomTitleLabel:@"快乐大本营"];
    [self setCustomLeftBtnWithImageName:FDDC_IMAGE_NAV_BACK];
    
    self.searchHeadView = FDDKLoadViewByNibName(@"SearchTableHeadView");
    [self.searchHeadView fillViewWithImageURL:@"demo_search_headview" headLabel:@"综艺：2003\n主持人：何日火 谢娜 李维嘉"];
    self.detailTableView.tableHeaderView = self.searchHeadView;
    
    self.detailDataSource = [[NSMutableArray alloc] initWithObjects:@"第1集",@"第2集",@"第3集",@"第4集",@"第5集",@"第6集",@"第7集",@"第8集",@"第9集",@"第10集",@"第11集",@"第12集",@"第13集",@"第14集",@"第15集",@"第16集",@"第17集",@"第18集",@"第19集",nil];
    
    UINib *seachHeadViewCellNib = [UINib nibWithNibName:@"SearchHeadViewTableViewCell" bundle:nil];
    [self.detailTableView registerNib:seachHeadViewCellNib forCellReuseIdentifier:@"searchheadviewcell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 表格的数据源和代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.detailDataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SearchHeadViewTableViewCell *searchCell = [tableView dequeueReusableCellWithIdentifier:@"searchheadviewcell" forIndexPath:indexPath];
    searchCell.selectionStyle = UITableViewCellSelectionStyleNone;
    [searchCell fillCellWith:[self.detailDataSource objectAtIndex:indexPath.row]];
    return searchCell;
}

@end
