//
//  SearchMainPageViewController.m
//  igo
//
//  Created by DingYunYu on 14/12/25.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "SearchMainPageViewController.h"
#import "FDDRoundCornersButton.h"
#import "SearchRecommendModel.h"
#import "SearchMainSectionView.h"
#import "SearchMainPageTableViewCell.h"
#import "FDDPageRedirect.h"

@interface SearchMainPageViewController ()<UITableViewDataSource,UITableViewDelegate,SearchMainSectionTapDelegate,UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIView *topSearchView;
@property (strong, nonatomic) IBOutlet UITableView *searchTableView;
@property (strong, nonatomic) IBOutlet UIButton *hideKeyBoardBtn;
@property (strong, nonatomic) NSMutableArray *searchRecommendDataSource;
@property (assign, nonatomic) int showCellIndex;

@end

@implementation SearchMainPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createSearchBtn];
    [self createVirtualData];
    self.showCellIndex = -1;
    
    UINib *seachMainPageCellNib = [UINib nibWithNibName:@"SearchMainPageTableViewCell" bundle:nil];
    [self.searchTableView registerNib:seachMainPageCellNib forCellReuseIdentifier:@"SeachMainPageCell"];
    
    [FDDKNotifactionDefaultCenter addObserver:self selector:@selector(showKeyBoard) name:UIKeyboardDidShowNotification object:nil];
    [FDDKNotifactionDefaultCenter addObserver:self selector:@selector(hideKeyBoard) name:UIKeyboardDidHideNotification object:nil];
}

- (void)dealloc
{
    [FDDKNotifactionDefaultCenter removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [FDDKNotifactionDefaultCenter removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 创建搜索按钮
- (void)createSearchBtn
{
    FDDRoundCornersButton *searchBtn = [[FDDRoundCornersButton alloc] initWithFrame:CGRectMake(255, 12, 50, 26) corners:5 backGroundColor:FDDKConvertColorBy0xHexRGB(0xBEBEBE)];
    [searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [searchBtn setTitleColor:FDDKConvertColorBy0xHexRGB(0x000000) forState:UIControlStateNormal];
    [searchBtn.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [self.topSearchView addSubview:searchBtn];
}

#pragma mark 创建虚拟数据源
- (void)createVirtualData
{
    self.searchRecommendDataSource = [[NSMutableArray alloc] init];
    for (int i=0; i<10; i++) {
        SearchRecommendModel *model = [[SearchRecommendModel alloc] init];
        model.itemImageURL = @"demo_message";
        model.itemtTitle = [NSString stringWithFormat:@"%d快乐大本营",i];
        model.itemChildrensTitle = [NSMutableArray arrayWithObjects:@"杜海涛",@"何日火",@"谢娜", nil];
        [self.searchRecommendDataSource addObject:model];
    }
}

#pragma mark - 表格的数据源和代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.searchRecommendDataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 88.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    SearchMainSectionView *sectionView = FDDKLoadViewByNibName(@"SearchMainSectionView");
    [sectionView fillSearchMainSectionWithModel:[self.searchRecommendDataSource objectAtIndex:section] index:(int)section];
    sectionView.delegate = self;
    return sectionView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == self.showCellIndex) {
        SearchRecommendModel *model = [self.searchRecommendDataSource objectAtIndex:section];
        return model.itemChildrensTitle.count;
    }else{
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SearchMainPageTableViewCell *searchCell = [tableView dequeueReusableCellWithIdentifier:@"SeachMainPageCell" forIndexPath:indexPath];
    searchCell.selectionStyle = UITableViewCellSelectionStyleNone;
    SearchRecommendModel *model = [self.searchRecommendDataSource objectAtIndex:indexPath.row];
    NSMutableArray *titleArray = model.itemChildrensTitle;
    [searchCell fillSearchMainPageCellWith:[titleArray objectAtIndex:indexPath.row]];
    return searchCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - 点击SectionView的代理
- (void)tapSearchMainSectionView:(SearchRecommendModel *)model index:(int)index
{
    if (self.showCellIndex == index) {
        self.showCellIndex = -1;
    }else{
        self.showCellIndex = index;
    }
    [self.searchTableView reloadData];
}

- (void)redirectToDetailPage:(SearchRecommendModel *)model
{
    [FDDPageRedirect redirectToSearchHeadViewDetailViewController:self];
}

#pragma mark 去掉headerview粘滞效果
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = 88;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

#pragma mark 显示键盘的监听
- (void)showKeyBoard
{
    self.hideKeyBoardBtn.hidden = NO;
}

#pragma mark 隐藏键盘的监听
- (void)hideKeyBoard
{
    self.hideKeyBoardBtn.hidden = YES;
}

#pragma mark 隐藏键盘
- (IBAction)hideKeyBoard:(id)sender
{
    [self.view endEditing:YES];
}


@end
