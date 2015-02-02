//
//  FDDCustomPickerView.m
//  NetVote
//
//  Created by DingYunYu on 14-8-14.
//  Copyright (c) 2014年 Lin Dongpeng. All rights reserved.
//

#import "FDDCustomPickerView.h"

#define FDDC_CONTROLVIEW_HEIGHT 40

@interface FDDCustomPickerView ()

@property (strong, nonatomic) UIView *maskView;
@property (strong, nonatomic) UIView *controlView;
@property (strong, nonatomic) UIButton *okbtn;
@property (assign, nonatomic) float fatherViewHeight;

@end

@implementation FDDCustomPickerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)AfterAddSubViewCreateAddtionView
{
    UIViewController *fatherController = (UIViewController *)[FDDUtils getNextResponder:self className:[UIViewController class]];
    self.fatherViewHeight = fatherController.view.frame.size.height;
    
    //添加操作栏
    self.controlView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, FDDC_CONTROLVIEW_HEIGHT)];
    if (FDDKIsIos7) {
        self.controlView.backgroundColor = [UIColor colorWithRed:0.969 green:0.969 blue:0.969 alpha:0.8];
    }else{
        self.controlView.backgroundColor = [UIColor colorWithRed:0.68 green:0.7 blue:0.77 alpha:1];
    }
    //加上完成按钮
    self.okbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.okbtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.okbtn.frame = CGRectMake(255, 0, 60, FDDC_CONTROLVIEW_HEIGHT);
    [self.okbtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.okbtn addTarget:self action:@selector(pressPickerViewOkBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.controlView addSubview:self.okbtn];
    [fatherController.view insertSubview:self.controlView belowSubview:self];
    
    //添加蒙版
    self.maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, self.fatherViewHeight)];
    self.maskView.backgroundColor = [UIColor colorWithRed:0.412 green:0.412 blue:0.412 alpha:0.7];
    [fatherController.view insertSubview:self.maskView belowSubview:self.controlView];
    //给蒙版添加触摸事件
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenCustomPickerView)];
    self.maskView.userInteractionEnabled = YES;
    [self.maskView addGestureRecognizer:singleTap];
    
    
    //设定位置在最底下并且超出边界
    FDDMFrameY(self.fatherViewHeight, self.controlView);
    FDDMFrameY(self.fatherViewHeight + FDDC_CONTROLVIEW_HEIGHT, self);
}

- (void)showCustomPickerView
{
    __weak typeof (self)bself = self;
    [UIView animateWithDuration:0.2 animations:^{
        FDDMFrameY(self.fatherViewHeight - bself.frame.size.height - FDDC_CONTROLVIEW_HEIGHT, bself.controlView);
        FDDMFrameY(self.fatherViewHeight - bself.frame.size.height, bself);
        bself.maskView.alpha = 0.7;
    }];
}

- (void)hiddenCustomPickerView
{
    __weak typeof (self)bself = self;
    [UIView animateWithDuration:0.2 animations:^{
        FDDMFrameY(self.fatherViewHeight, bself.controlView);
        FDDMFrameY(self.fatherViewHeight + FDDC_CONTROLVIEW_HEIGHT, bself);
        bself.maskView.alpha = 0.0;
    }completion:^(BOOL finished) {
        
    }];
}

- (void)pressPickerViewOkBtn:(id)sender
{
    if ([self.pressOkDelegate respondsToSelector:@selector(pickerView:pressOkBtnBySelectRow:inComponent:)]) {
        [self.pressOkDelegate pickerView:self pressOkBtnBySelectRow:[self selectedRowInComponent:0] inComponent:0];
    }
}

@end
