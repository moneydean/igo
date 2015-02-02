//
//  MainPageHeadView.m
//  igo
//
//  Created by DingYunYu on 14/12/18.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "MainPageHeadView.h"
#import "XLCycleScrollView.h"
#import "UIImageView+WebCache.h"

@interface MainPageHeadView ()<XLCycleScrollViewDatasource,XLCycleScrollViewDelegate>

@property (strong, nonatomic) XLCycleScrollView *cyclescrollview;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation MainPageHeadView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self createCycleScrollView];
        [self addCycleTimer];
    }
    return self;
}

#pragma mark 创建轮播图
- (void)createCycleScrollView
{
    self.cyclescrollview = [[XLCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 104)];
    self.cyclescrollview.delegate = self;
    self.cyclescrollview.datasource = self;
    [self addSubview:self.cyclescrollview];
}

#pragma mark 轮播图定时翻页
- (void)addCycleTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:4
                                                  target:self
                                                selector:@selector(changeCyclePage)
                                                userInfo:nil
                                                 repeats:YES];
}

#pragma mark 轮播图切换页面
- (void)changeCyclePage
{
    [self.cyclescrollview scrollToNextPage];
}

#pragma mark 轮播图的代理
- (NSInteger)numberOfPages
{
    return 5;
}

- (UIView *)pageAtIndex:(NSInteger)index
{
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 104)];
    switch (index) {
        case 0:{
            view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"scrollview_demo1"]];
            break;
        }
        case 1:{
            view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"scrollview_demo1"]];
            break;
        }
        case 2:{
            view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"scrollview_demo1"]];
            break;
        }
        case 3:{
            view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"scrollview_demo1"]];
        }
        case 4:{
            view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"scrollview_demo1"]];
        }
        default:
            break;
    }
    return view;
}

- (void)XLCycleViewDidEndDecelerating:(XLCycleScrollView *)csView atIndex:(NSInteger)index
{
    [self.timer invalidate];
    self.timer = nil;
    [self addCycleTimer];
}

- (void)didClickPage:(XLCycleScrollView *)csView atIndex:(NSInteger)index
{
    NSLog(@"%ld",(long)index);
}

@end
