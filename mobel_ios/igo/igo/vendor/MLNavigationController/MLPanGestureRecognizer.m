//
//  MLPanGestureRecognizer.m
//  NetVote
//
//  Created by DingYunYu on 14-9-19.
//  Copyright (c) 2014年 Lin Dongpeng. All rights reserved.
//

#import "MLPanGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface MLPanGestureRecognizer ()

@property (assign, nonatomic) CGPoint beganLocation;
@property (assign, nonatomic) CGPoint nowLocation;
@property (strong, nonatomic) UIEvent *event;
@property (assign, nonatomic) NSTimeInterval beganTime;

@end

@implementation MLPanGestureRecognizer

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.beganLocation = [touch locationInView:self.view];
    self.event = event;
    self.beganTime = event.timestamp;
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.nowLocation = [touch locationInView:self.view];
    if (self.nowLocation.x - self.beganLocation.x < 0) {
        self.state = UIGestureRecognizerStateFailed;
        return;
    }
    if (self.state == UIGestureRecognizerStatePossible && event.timestamp - self.beganTime > 0.3) {
        self.state = UIGestureRecognizerStateFailed;
        return;
    }
    [super touchesMoved:touches withEvent:event];
}

- (void)reset
{
    self.beganLocation = CGPointZero;
    self.event = nil;
    self.beganTime = 0;
    [super reset];
}

- (CGPoint)beganLocationInView:(UIView *)view
{
    return [view convertPoint:self.beganLocation fromView:self.view];
}

@end
