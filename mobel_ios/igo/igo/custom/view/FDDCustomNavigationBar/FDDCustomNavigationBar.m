//
//  HPCustomNavigationBar.m
//  papm
//
//  Created by dean on 13-11-19.
//  Copyright (c) 2013年 pingan. All rights reserved.
//

#import "FDDCustomNavigationBar.h"

@implementation FDDCustomNavigationBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (FDDKIsIos7) {
            self.translucent = NO;
        }
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    [[UIImage imageNamed:@"navigation_background"] drawInRect:rect];
    
//    //这里设置statusbar为黑色有3个地方，一个是plist文件需要添加一个值UIViewControllerBasedStatusBarAppearance = NO
    //然后是appdelegate的UIStatusBarStyleLightContent，再就是这里的代码了
    UIColor *statusbarbgcolor = [[UIColor blackColor] colorWithAlphaComponent:1.0f];
    CALayer *statusbarlayer = [CALayer layer];
    statusbarlayer.backgroundColor = [statusbarbgcolor CGColor];
    statusbarlayer.frame = CGRectMake(0, -FDDC_STATUS_BAR_HEIGHT, self.frame.size.width,FDDC_STATUS_BAR_HEIGHT);
    [self.layer addSublayer:statusbarlayer];
    statusbarlayer.zPosition = -1;
}


@end
