//
//  CircumDetailViewController.m
//  igo
//
//  Created by DingYunYu on 15/1/13.
//  Copyright (c) 2015年 DingYunYu. All rights reserved.
//

#import "CircumDetailViewController.h"
#import "CommonItemModel.h"
#import "MainPageCollectionViewCell.h"
#import "FDDPageRedirect.h"
#import "LoginViewController.h"
#import "FDDCustomNavigationBar.h"

@interface CircumDetailViewController ()<ItemControlDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *topImageView;
@property (strong, nonatomic) IBOutlet UILabel *topLabel;
@property (strong, nonatomic) IBOutlet UIButton *topLeftBtn;
@property (strong, nonatomic) IBOutlet UIButton *topRightBtn;
@property (strong, nonatomic) IBOutlet UIView *topBottomPinkLine;

@property (strong, nonatomic) UICollectionView *circumItemCollectionView;
@property (strong, nonatomic) NSMutableArray *circumItemDataSource;

@property (strong, nonatomic) UICollectionView *circumEntertainmentCollectionView;
@property (strong, nonatomic) NSMutableArray *circumEntertainmentDataSource;

@end

@implementation CircumDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setCustomTitleLabel:@"周边详情"];
    [self setCustomLeftBtnWithImageName:FDDC_IMAGE_NAV_BACK];
    
    [self createItemVitrulDataSource];
    [self createItemWaterFallCollectionViewLayout];
    
    [self createEntertainmentVitrulDataSource];
    [self createEntertainmentWaterFallCollectionViewLayout];
    
    self.topLeftBtn.selected = YES;
    self.circumEntertainmentCollectionView.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 切换产品和娱乐圈
- (IBAction)changeSegment:(UIButton *)senderBtn
{
    if (senderBtn == self.topLeftBtn) {
        self.topRightBtn.selected = NO;
        [UIView animateWithDuration:0.25 animations:^{
            FDDMFrameX(20, self.topBottomPinkLine);
        }];
        self.circumItemCollectionView.hidden = NO;
        self.circumEntertainmentCollectionView.hidden = YES;
    }else{
        self.topLeftBtn.selected = NO;
        [UIView animateWithDuration:0.25 animations:^{
            FDDMFrameX(180, self.topBottomPinkLine);
        }];
        self.circumItemCollectionView.hidden = YES;
        self.circumEntertainmentCollectionView.hidden = NO;
    }
    senderBtn.selected = YES;
}

#pragma mark 弄个Item假数据
- (void)createItemVitrulDataSource
{
    self.circumItemDataSource = [[NSMutableArray alloc] init];
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
        [self.circumItemDataSource addObject:model];
    }
}

#pragma mark 创建Item瀑布流
- (void)createItemWaterFallCollectionViewLayout
{
    //创建layout
    CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.headerHeight = 10;
    layout.footerHeight = 10;
    layout.minimumColumnSpacing = 10;//横向不同行的间距
    layout.minimumInteritemSpacing = 10;//竖向同一行的间距
    
    //创建collectionView
    self.circumItemCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 144, 320, FDDKBoundsHeightSubStatusNavTab - 144) collectionViewLayout:layout];
    self.circumItemCollectionView.dataSource = self;
    self.circumItemCollectionView.delegate = self;
    self.circumItemCollectionView.backgroundColor = [UIColor whiteColor];
    
    [self.circumItemCollectionView registerClass:[MainPageCollectionViewCell class]
                    forCellWithReuseIdentifier:@"MaiPageWaterfallCell"];
    
    [self.view addSubview:self.circumItemCollectionView];
}

#pragma mark 弄个Entertainment假数据
- (void)createEntertainmentVitrulDataSource
{
    self.circumEntertainmentDataSource = [[NSMutableArray alloc] init];
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
        [self.circumEntertainmentDataSource addObject:model];
    }
}

#pragma mark 创建Entertainment瀑布流
- (void)createEntertainmentWaterFallCollectionViewLayout
{
    //创建layout
    CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.headerHeight = 10;
    layout.footerHeight = 10;
    layout.minimumColumnSpacing = 10;//横向不同行的间距
    layout.minimumInteritemSpacing = 10;//竖向同一行的间距
    
    //创建collectionView
    self.circumEntertainmentCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 144, 320, FDDKBoundsHeightSubStatusNavTab - 144) collectionViewLayout:layout];
    self.circumEntertainmentCollectionView.dataSource = self;
    self.circumEntertainmentCollectionView.delegate = self;
    self.circumEntertainmentCollectionView.backgroundColor = [UIColor whiteColor];
    
    [self.circumEntertainmentCollectionView registerClass:[MainPageCollectionViewCell class]
                      forCellWithReuseIdentifier:@"MaiPageWaterfallCell"];
    
    [self.view addSubview:self.circumEntertainmentCollectionView];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (collectionView == self.circumItemCollectionView) {
        return self.circumItemDataSource.count;
    }else if(collectionView == self.circumEntertainmentCollectionView){
        return self.circumEntertainmentDataSource.count;
    }else{
        return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView == self.circumItemCollectionView) {
        
        MainPageCollectionViewCell *cell = (MainPageCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"MaiPageWaterfallCell" forIndexPath:indexPath];
        cell.delegate = self;
        CommonItemModel *ci = (CommonItemModel *)[self.circumItemDataSource objectAtIndex:indexPath.row];
        [cell fillCellWith:ci];
        
        return cell;
        
    }else if(collectionView == self.circumEntertainmentCollectionView){
        
        MainPageCollectionViewCell *cell = (MainPageCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"MaiPageWaterfallCell" forIndexPath:indexPath];
        cell.delegate = self;
        CommonItemModel *ci = (CommonItemModel *)[self.circumItemDataSource objectAtIndex:indexPath.row];
        [cell fillCellWith:ci];
        
        return cell;
        
    }else{
        return nil;
    }
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView == self.circumItemCollectionView) {
        
        CommonItemModel *ci = (CommonItemModel *)[self.circumItemDataSource objectAtIndex:indexPath.row];
        return CGSizeMake(ci.imageWidth, ci.imageHeight);
        
    }else if(collectionView == self.circumEntertainmentCollectionView){
        
        CommonItemModel *ci = (CommonItemModel *)[self.circumEntertainmentDataSource objectAtIndex:indexPath.row];
        return CGSizeMake(ci.imageWidth, ci.imageHeight);
        
    }else{
        return CGSizeMake(0, 0);
    }
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
