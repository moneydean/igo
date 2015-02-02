//
//  UIBaseViewController.h
//  papm
//
//  Created by dean on 13-11-19.
//  Copyright (c) 2013年 pingan. All rights reserved.
//
// 所有视图类的基类

#import <UIKit/UIKit.h>
#import "UIBaseViewController.h"

#define NAVIGATION_BAR_TEXT_COLOR   FDDKConvertColorBy0xHexRGB(0xFFFFFF)

typedef enum{
    FDDEMaskViewTypeGray            = 1, //灰色效果
    FDDEMaskViewTypeGlass           = 2, //毛玻璃效果
}FDDEMaskViewType;

typedef void (^TouchMaskViewBlock)(void);

@interface UIBaseViewController : UIViewController

@property (copy, nonatomic) TouchMaskViewBlock touchMaskViewBlock;

#pragma mark 设置自定义标题视图
- (void)setCustomTitleView:(NSString *)imageName;

#pragma mark 设置标题
- (void)setCustomTitleLabel:(NSString *)title;

#pragma mark 设置左边按钮（仅带标题）
- (UIButton *)setCustomLeftBtnWithTitle:(NSString *)title;

#pragma mark 设置左边的返回按钮
- (UIButton *)setCustomLeftBtnWithImageName:(NSString *)imageName;

#pragma mark 设置左边的返回按钮，并替换掉返回的方法
- (UIButton *)setCustomLeftBtnWithImageName:(NSString *)imageName backSEL:(SEL)backSEL;

#pragma mark 设置右边按钮（仅带标题）
- (UIButton *)setCustomRightBtnWithTitle:(NSString *)title touchSelector:(SEL)touchSelector;

#pragma mark 设置右边的按钮
- (UIButton *)setCustomRightBtnWithImageName:(NSString *)imageName touchSelector:(SEL)touchSelector;

#pragma mark 设置右边的按钮及尺寸
- (UIButton *)setCustomRightBtnWithImageName:(NSString *)imageName touchSelector:(SEL)touchSelector size:(CGSize)size;

#pragma mark 设置右边的按钮及尺寸
- (UIView *)setCustomRight:(UIView *)customview;

#pragma mark 默认返回上一页
- (void)defaultPopView:(id)sender;

#pragma mark 设置左边的返回按钮
- (UIButton *)setCustomLeftBtnWithImageName:(NSString *)imageName btnTitle:(NSString *)btnTitle;

#pragma mark 更新返回按钮的title
- (void)refreshCustomLeftBtnTitle:(NSString *)title;

#pragma mark 显示一个遮罩
- (void)showMaskViewOnMotherView:(UIView *)motherView maskType:(FDDEMaskViewType)maskType afterMaskViewCreateBlock:(void (^)(UIView *maskView))afterMaskViewCreateBlock touchMaskView:(TouchMaskViewBlock)touchMaskView;

#pragma mark 隐藏一个遮罩
- (void)hideMaskView:(UIView *)motherView;

@end
