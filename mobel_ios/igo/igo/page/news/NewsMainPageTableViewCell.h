//
//  NewsMainPageTableViewCell.h
//  igo
//
//  Created by DingYunYu on 14/12/25.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@interface NewsMainPageTableViewCell : UITableViewCell

- (void)fillCellContentWith:(NewsModel *)model;

@end
