//
//  CollocationItemViewController.m
//  igo
//
//  Created by DingYunYu on 14/12/31.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "CollocationItemViewController.h"
#import "ItemColloactionCollectionViewCell.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "CollocationItemHeadView.h"
#import "MainPageFooterView.h"
#import "FDDPageRedirect.h"

@interface CollocationItemViewController ()<UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout,CollocationItemClickDelegate>

@property (strong, nonatomic) UICollectionView *itemCollectionView;

@end

@implementation CollocationItemViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setCustomTitleLabel:@"刘德华金鹰节搭配图"];
    [self setCustomLeftBtnWithImageName:FDDC_IMAGE_NAV_BACK];
    
    [self createWaterFallCollectionViewLayout];
}

#pragma mark 创建瀑布流
- (void)createWaterFallCollectionViewLayout
{
    //创建layout
    CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.headerHeight = 190;
    layout.footerHeight = 10;
    layout.minimumColumnSpacing = 10;//横向不同行的间距
    layout.minimumInteritemSpacing = 10;//竖向同一行的间距
    
    //创建collectionView
    self.itemCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.itemCollectionView.dataSource = self;
    self.itemCollectionView.delegate = self;
    self.itemCollectionView.backgroundColor = FDDKConvertColorBy0xHexRGB(0xE8E8E8);

    [self.itemCollectionView registerClass:[ItemColloactionCollectionViewCell class]
                    forCellWithReuseIdentifier:@"itemColloactionCell"];
    
    UINib *headnib = [UINib nibWithNibName:@"CollocationItemHeadView" bundle:nil];
    [self.itemCollectionView registerNib:headnib forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:@"CollocationHead"];
    [self.itemCollectionView registerClass:[MainPageFooterView class] forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter withReuseIdentifier:@"CollocationFooter"];
    
    
    [self.view addSubview:self.itemCollectionView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - collectionview的数据源和代理
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ItemColloactionCollectionViewCell *cell = (ItemColloactionCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"itemColloactionCell" forIndexPath:indexPath];
    [cell fillItemWithChannel:@"淘宝" price:100.10];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:CHTCollectionElementKindSectionHeader]) {
        CollocationItemHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:@"CollocationHead"forIndexPath:indexPath];
        headView.delegate = self;
        [headView fillItemScrollView:[NSMutableArray arrayWithObjects:@"demo_coll_scroll_item",@"demo_coll_scroll_item",@"demo_coll_scroll_item",@"demo_coll_scroll_item",@"demo_coll_scroll_item",@"demo_coll_scroll_item",nil] topImage:@"demo_coll_top"];
        return headView;
        
    }else if ([kind isEqualToString:CHTCollectionElementKindSectionFooter]){
        UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter withReuseIdentifier:@"CollocationFooter"forIndexPath:indexPath];
        return reusableView;
    }
    
    return nil;
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(150, 185);
    
}

#pragma mark 点击单个图片的代理
- (void)clickCollocationItem
{
    [FDDPageRedirect redirectToSingleItemViewController:self];
}

#pragma mark 点击最后一个图片
- (void)clickLastCollocationImageView
{
    [FDDPageRedirect redirectToCircumDetailViewController:self];
}

@end
