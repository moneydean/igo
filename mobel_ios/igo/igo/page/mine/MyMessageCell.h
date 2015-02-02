//
//  MyMessageCell.h
//  igo
//
//  Created by DingYunYu on 14/12/23.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MineMessageModel.h"

@interface MyMessageCell : UITableViewCell

- (void)fillCellContentWithModel:(MineMessageModel *)model;

@end
