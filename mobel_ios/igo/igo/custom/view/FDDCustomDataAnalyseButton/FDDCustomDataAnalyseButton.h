//
//  FDDCustomDataAnalyseView.h
//  NetVote
//
//  Created by DingYunYu on 14-9-1.
//  Copyright (c) 2014年 Lin Dongpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TouchAnalyseButtonBlock)(void);

@interface FDDCustomDataAnalyseButton : UIView

@property (copy, nonatomic) TouchAnalyseButtonBlock touchAnalyseButtonBlock;

- (void)fillViewByTitle:(NSString *)title;

- (void)addTouchEventBlock:(TouchAnalyseButtonBlock)block;

@end
