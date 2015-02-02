//
//  MyFavoriteViewController.m
//  igo
//
//  Created by DingYunYu on 14/12/23.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "MyFavoriteViewController.h"
#import "MainPageCollectionViewCell.h"
#import "CommonItemModel.h"

@interface MyFavoriteViewController ()<ItemControlDelegate>

@property (strong, nonatomic) UICollectionView *hotPageCollectionView;
@property (strong, nonatomic) NSMutableArray *hotPageDataSource;

@end

@implementation MyFavoriteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setCustomLeftBtnWithImageName:FDDC_IMAGE_NAV_BACK];
    [self setCustomTitleLabel:@"我的收藏"];
    [self createVitrulDataSource];
    [self createWaterFallCollectionViewLayout];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 弄个假数据
- (void)createVitrulDataSource
{
    self.hotPageDataSource = [[NSMutableArray alloc] init];
    for (int i=0; i<40; i++) {
        CommonItemModel *model = [[CommonItemModel alloc] init];
        model.imageURL = [NSString stringWithFormat:@"waterfall_demo%d",i%4+1];
        model.favoritesCount = i+1000;
        model.itemSummary = [NSString stringWithFormat:@"物品描述物品描述物品描述物品描述物品描述%d",i+1000];
        switch (i%4) {
            case 0:{
                model.imageWidth = 147;
                model.imageHeight = 185;
                break;
            }
            case 1:{
                model.imageWidth = 176;
                model.imageHeight = 154;
                break;
            }
            case 2:{
                model.imageWidth = 220;
                model.imageHeight = 381;
                break;
            }
            case 3:{
                model.imageWidth = 250;
                model.imageHeight = 314;
                break;
            }
            default:
                break;
        }
        [self.hotPageDataSource addObject:model];
    }
}

#pragma mark 添加假数据
- (void)addVitrulDataSource
{
    for (int i=0; i<20; i++) {
        CommonItemModel *model = [[CommonItemModel alloc] init];
        model.imageURL = [NSString stringWithFormat:@"waterfall_demo%d",i%4+1];
        model.favoritesCount = i;
        model.itemSummary = [NSString stringWithFormat:@"物品描述%d",i];
        switch (i%4) {
            case 0:{
                model.imageWidth = 147;
                model.imageHeight = 185;
                break;
            }
            case 1:{
                model.imageWidth = 176;
                model.imageHeight = 154;
                break;
            }
            case 2:{
                model.imageWidth = 220;
                model.imageHeight = 381;
                break;
            }
            case 3:{
                model.imageWidth = 250;
                model.imageHeight = 314;
                break;
            }
            default:
                break;
        }
        [self.hotPageDataSource addObject:model];
    }
}

#pragma mark 创建瀑布流
- (void)createWaterFallCollectionViewLayout
{
    //创建layout
    CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.minimumColumnSpacing = 10;//横向不同行的间距
    layout.minimumInteritemSpacing = 10;//竖向同一行的间距
    
    //创建collectionView
    self.hotPageCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.hotPageCollectionView.dataSource = self;
    self.hotPageCollectionView.delegate = self;
    self.hotPageCollectionView.backgroundColor = [UIColor whiteColor];
    [self.hotPageCollectionView registerClass:[MainPageCollectionViewCell class]
                   forCellWithReuseIdentifier:@"MaiPageWaterfallCell"];
    
    [self.view addSubview:self.hotPageCollectionView];
    
    //添加下拉和上推事件
    FDDM_Block_Weak bself = self;
    [bself.hotPageCollectionView addPullToRefreshWithActionHandler:^{
        [bself createVitrulDataSource];
        [bself.hotPageCollectionView reloadData];
        FDDMHideSVPullWithSucc(bself.hotPageCollectionView);
    }];
    [bself.hotPageCollectionView addInfiniteScrollingWithActionHandler:^{
        [bself addVitrulDataSource];
        [bself.hotPageCollectionView reloadData];
        FDDMHideInfiniteScrollingView(bself.hotPageCollectionView);
    }];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.hotPageDataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MainPageCollectionViewCell *cell = (MainPageCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"MaiPageWaterfallCell" forIndexPath:indexPath];
    cell.delegate = self;
    CommonItemModel *ci = (CommonItemModel *)[self.hotPageDataSource objectAtIndex:indexPath.row];
    [cell fillCellWith:ci];
    
    return cell;
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CommonItemModel *ci = (CommonItemModel *)[self.hotPageDataSource objectAtIndex:indexPath.row];
    return CGSizeMake(ci.imageWidth, ci.imageHeight);
    
}

#pragma mark - 瀑布流的cell的点击代理
- (void)itemImageViewClick:(CommonItemModel *)model
{
    FDDMPrintFunctionName();
}

- (void)itemFavoriteClick:(CommonItemModel *)model cell:(MainPageCollectionViewCell *)cell
{
    FDDMPrintFunctionName();
    if (cell) {
        [cell itemFavoriteCallBack:YES];
    }
}

@end
