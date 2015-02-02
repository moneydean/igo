//
//  MLPanGestureRecognizer.h
//  NetVote
//
//  Created by DingYunYu on 14-9-19.
//  Copyright (c) 2014年 Lin Dongpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLPanGestureRecognizer : UIPanGestureRecognizer

@property (readonly, nonatomic) UIEvent *event;

- (CGPoint)beganLocationInView:(UIView *)view;

@end
