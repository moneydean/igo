//
//  MainPageViewController.m
//  igo
//
//  Created by DingYunYu on 14/12/3.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "MainPageViewController.h"
#import "MainPageCollectionViewCell.h"
#import "MainPageHeadView.h"
#import "MainPageFooterView.h"
#import "CommonItemModel.h"
#import "LoginViewController.h"
#import "FDDCustomNavigationBar.h"
#import "FDDPageRedirect.h"
#import "CollocationItemViewController.h"

@interface MainPageViewController ()<ItemControlDelegate>

@property (strong, nonatomic) UICollectionView *mainPageCollectionView;
@property (strong, nonatomic) NSMutableArray *mainPageDataSource;

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setCustomTitleView:@"navigation_logo_igo"];
    [self createVitrulDataSource];
    [self createWaterFallCollectionViewLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 弄个假数据
- (void)createVitrulDataSource
{
    self.mainPageDataSource = [[NSMutableArray alloc] init];
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
        [self.mainPageDataSource addObject:model];
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
        [self.mainPageDataSource addObject:model];
    }
}

#pragma mark 创建瀑布流
- (void)createWaterFallCollectionViewLayout
{
    //创建layout
    CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.headerHeight = 104;
    layout.footerHeight = 10;
    layout.minimumColumnSpacing = 10;//横向不同行的间距
    layout.minimumInteritemSpacing = 10;//竖向同一行的间距

    //创建collectionView
    self.mainPageCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.mainPageCollectionView.dataSource = self;
    self.mainPageCollectionView.delegate = self;
    self.mainPageCollectionView.backgroundColor = [UIColor whiteColor];
    
    [self.mainPageCollectionView registerClass:[MainPageCollectionViewCell class]
        forCellWithReuseIdentifier:@"MaiPageWaterfallCell"];
    [self.mainPageCollectionView registerClass:[MainPageHeadView class] forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:@"MaiPageWaterfallHead"];
    [self.mainPageCollectionView registerClass:[MainPageFooterView class] forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter withReuseIdentifier:@"MaiPageWaterfallFoot"];
    
    [self.view addSubview:self.mainPageCollectionView];
    
    //添加下拉和上推事件
    FDDM_Block_Weak bself = self;
    [bself.mainPageCollectionView addPullToRefreshWithActionHandler:^{
        [bself createVitrulDataSource];
        [bself.mainPageCollectionView reloadData];
        FDDMHideSVPullWithSucc(bself.mainPageCollectionView);
    }];
    [bself.mainPageCollectionView addInfiniteScrollingWithActionHandler:^{
        [bself addVitrulDataSource];
        [bself.mainPageCollectionView reloadData];
        FDDMHideInfiniteScrollingView(bself.mainPageCollectionView);
    }];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.mainPageDataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MainPageCollectionViewCell *cell = (MainPageCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"MaiPageWaterfallCell" forIndexPath:indexPath];
    cell.delegate = self;
    CommonItemModel *ci = (CommonItemModel *)[self.mainPageDataSource objectAtIndex:indexPath.row];
    [cell fillCellWith:ci];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableView;
    
    if ([kind isEqualToString:CHTCollectionElementKindSectionHeader]) {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:@"MaiPageWaterfallHead"forIndexPath:indexPath];
    }else if ([kind isEqualToString:CHTCollectionElementKindSectionFooter]){
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter withReuseIdentifier:@"MaiPageWaterfallFoot"forIndexPath:indexPath];
    }
    
    return reusableView;
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CommonItemModel *ci = (CommonItemModel *)[self.mainPageDataSource objectAtIndex:indexPath.row];
    return CGSizeMake(ci.imageWidth, ci.imageHeight);
    
}

#pragma mark - 瀑布流的cell的点击代理
- (void)itemImageViewClick:(CommonItemModel *)model
{
    [FDDPageRedirect redirectToCollocationItemViewController:self];
}

- (void)itemFavoriteClick:(CommonItemModel *)model cell:(MainPageCollectionViewCell *)cell
{
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithNavigationBarClass:[FDDCustomNavigationBar class] toolbarClass:nil];
    nav.viewControllers = [NSArray arrayWithObject:loginVC];
    [self presentViewController:nav animated:YES completion:^{
        if (cell) {
            [cell itemFavoriteCallBack:YES];
        }
    }];
}

@end
