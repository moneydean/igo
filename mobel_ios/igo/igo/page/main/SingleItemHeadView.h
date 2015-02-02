//
//  SingleItemHeadView.h
//  igo
//
//  Created by DingYunYu on 15/1/12.
//  Copyright (c) 2015年 DingYunYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleItemHeadView : UIView

- (void)fillHeadViewWith:(NSString *)imageURL
                itemDesc:(NSString *)itemDesc
                   brand:(NSString *)brand;

@end
