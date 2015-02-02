//
//  MainPageViewController.h
//  igo
//
//  Created by DingYunYu on 14/12/3.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "UIBaseViewController.h"
#import "CHTCollectionViewWaterfallLayout.h"

@interface MainPageViewController : UIBaseViewController<UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout>

@end
