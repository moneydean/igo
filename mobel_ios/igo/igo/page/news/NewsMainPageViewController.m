//
//  NewsMainPageViewController.m
//  igo
//
//  Created by DingYunYu on 14/12/23.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "NewsMainPageViewController.h"
#import "FDDUITableViewPaging.h"
#import "NewsModel.h"
#import "NewsMainPageTableViewCell.h"
#import "FDDPageRedirect.h"

@interface NewsMainPageViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *segmentView;
@property (strong, nonatomic) IBOutlet FDDUITableViewPaging *messageTableView;
@property (strong, nonatomic) NSMutableArray *informationDataSource;
@property (strong, nonatomic) NSMutableArray *movieDataSource;
@property (strong, nonatomic) NSMutableArray *sitcomDataSource;
@property (strong, nonatomic) NSMutableArray *varietyDataSource;
@property (strong, nonatomic) NSMutableArray *cartoonDataSource;

@property (assign, nonatomic) FDDENewsType newsType;

@property (assign, nonatomic) CGPoint informationOffSet;
@property (assign, nonatomic) CGPoint movieOffSet;
@property (assign, nonatomic) CGPoint sitcomOffSet;
@property (assign, nonatomic) CGPoint varietyOffSet;
@property (assign, nonatomic) CGPoint cartoonOffSet;

@end

@implementation NewsMainPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setCustomTitleLabel:@"最新资讯"];
    self.newsType = FDDENewsTypeInforMation;
    UINib *newsCellNib = [UINib nibWithNibName:@"NewsMainPageTableViewCell" bundle:nil];
    [self.messageTableView registerNib:newsCellNib forCellReuseIdentifier:@"newsCell"];
    [self createVirtualData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 改变选择的新闻类型
- (IBAction)changeNewsType:(id)sender
{
    [self changeAllBtnToUnSelectedState];
    UIButton *typeBtn = (UIButton *)sender;
    typeBtn.selected = YES;
    
    switch (self.newsType) {
        case FDDENewsTypeInforMation:
            self.informationOffSet = self.messageTableView.contentOffset;
            break;
        case FDDENewsTypeMovie:
            self.movieOffSet = self.messageTableView.contentOffset;
            break;
        case FDDENewsTypeSitcom:
            self.sitcomOffSet = self.messageTableView.contentOffset;
            break;
        case FDDENewsTypeVariety:
            self.varietyOffSet = self.messageTableView.contentOffset;
            break;
        case FDDENewsTypecartoon:
            self.cartoonOffSet = self.messageTableView.contentOffset;
            break;
        default:
            break;
    }
    
    NSString *btnTitle = typeBtn.titleLabel.text;
    if ([btnTitle isEqualToString:@"资讯"]) {
        self.newsType = FDDENewsTypeInforMation;
    }else if([btnTitle isEqualToString:@"电影"]){
        self.newsType = FDDENewsTypeMovie;
    }else if([btnTitle isEqualToString:@"电视剧"]){
        self.newsType = FDDENewsTypeSitcom;
    }else if([btnTitle isEqualToString:@"综艺"]){
        self.newsType = FDDENewsTypeVariety;
    }else if([btnTitle isEqualToString:@"动漫"]){
        self.newsType = FDDENewsTypecartoon;
    }
    
    [self.messageTableView reloadData];
    
    if ([btnTitle isEqualToString:@"资讯"]) {
        [self.messageTableView setContentOffset:self.informationOffSet animated:NO];
    }else if([btnTitle isEqualToString:@"电影"]){
        [self.messageTableView setContentOffset:self.movieOffSet animated:NO];
    }else if([btnTitle isEqualToString:@"电视剧"]){
        [self.messageTableView setContentOffset:self.sitcomOffSet animated:NO];
    }else if([btnTitle isEqualToString:@"综艺"]){
        [self.messageTableView setContentOffset:self.varietyOffSet animated:NO];
    }else if([btnTitle isEqualToString:@"动漫"]){
        [self.messageTableView setContentOffset:self.cartoonOffSet animated:NO];
    }
}

#pragma mark 将所有按钮改为未选中状态
- (void)changeAllBtnToUnSelectedState
{
    for (id view in [self.segmentView subviews]) {
        if ([view isKindOfClass:[UIButton class]]) {
            [(UIButton *)view setSelected:NO];
        }
    }
}

#pragma mark 创建虚拟的数据源
- (void)createVirtualData
{
    self.informationDataSource = [[NSMutableArray alloc] init];
    self.movieDataSource = [[NSMutableArray alloc] init];
    self.sitcomDataSource = [[NSMutableArray alloc] init];
    self.varietyDataSource = [[NSMutableArray alloc] init];
    self.cartoonDataSource = [[NSMutableArray alloc] init];
    for (int i=0; i<30; i++) {
        NewsModel *newsModel = [[NewsModel alloc] init];
        newsModel.imageURL = @"demo_message";
        newsModel.title = [NSString stringWithFormat:@"%d七年后歌神回归因经济危机？张学友：金融这块亏了很多钱",i];
        newsModel.contentURL = @"http://www.baidu.com";
        [self.informationDataSource addObject:newsModel];
        [self.movieDataSource addObject:newsModel];
        [self.sitcomDataSource addObject:newsModel];
        [self.varietyDataSource addObject:newsModel];
        [self.cartoonDataSource addObject:newsModel];
    }
}

#pragma mark - 表格的数据源和代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (self.newsType) {
        case FDDENewsTypeInforMation:
            return self.informationDataSource.count;
            break;
        case FDDENewsTypeMovie:
            return self.movieDataSource.count;
            break;
        case FDDENewsTypeSitcom:
            return self.sitcomDataSource.count;
            break;
        case FDDENewsTypeVariety:
            return self.varietyDataSource.count;
            break;
        case FDDENewsTypecartoon:
            return self.cartoonDataSource.count;
            break;
        default:
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 88;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsMainPageTableViewCell *newsCell = [tableView dequeueReusableCellWithIdentifier:@"newsCell" forIndexPath:indexPath];
    newsCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    switch (self.newsType) {
        case FDDENewsTypeInforMation:
            [newsCell fillCellContentWith:[self.informationDataSource objectAtIndex:indexPath.row]];
            break;
        case FDDENewsTypeMovie:
            [newsCell fillCellContentWith:[self.movieDataSource objectAtIndex:indexPath.row]];
            break;
        case FDDENewsTypeSitcom:
            [newsCell fillCellContentWith:[self.sitcomDataSource objectAtIndex:indexPath.row]];
            break;
        case FDDENewsTypeVariety:
            [newsCell fillCellContentWith:[self.varietyDataSource objectAtIndex:indexPath.row]];
            break;
        case FDDENewsTypecartoon:
            [newsCell fillCellContentWith:[self.cartoonDataSource objectAtIndex:indexPath.row]];
            break;
        default:
            break;
    }
    
    return newsCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsModel *model;
    switch (self.newsType) {
        case FDDENewsTypeInforMation:
            model = [self.informationDataSource objectAtIndex:indexPath.row];
            break;
        case FDDENewsTypeMovie:
            model = [self.movieDataSource objectAtIndex:indexPath.row];
            break;
        case FDDENewsTypeSitcom:
            model = [self.sitcomDataSource objectAtIndex:indexPath.row];
            break;
        case FDDENewsTypeVariety:
            model = [self.varietyDataSource objectAtIndex:indexPath.row];
            break;
        case FDDENewsTypecartoon:
            model = [self.cartoonDataSource objectAtIndex:indexPath.row];
            break;
        default:
            break;
    }
    
    [FDDPageRedirect redirectToNewsMessageViewController:self url:model.contentURL];
}

@end
