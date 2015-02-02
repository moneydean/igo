//
//  UIBaseViewController.m
//  papm
//
//  Created by dean on 13-11-19.
//  Copyright (c) 2013年 pingan. All rights reserved.
//

#import "UIBaseViewController.h"

@interface UIBaseViewController ()

@end

@implementation UIBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
//    DDLogInfo(@"打开了 %@ 窗口", self.class);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 设置自定义标题视图
- (void)setCustomTitleView:(NSString *)imageName
{
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 38, 30)];
    imageview.image = [UIImage imageNamed:imageName];
    self.navigationItem.titleView = imageview;
}

#pragma mark - 设置标题
- (void)setCustomTitleLabel:(NSString *)title
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, 200,44)];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:18];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = NAVIGATION_BAR_TEXT_COLOR;
    label.text = title;
    self.navigationItem.titleView = label;
}

#pragma mark - 设置左边按钮仅标题
- (UIButton *)setCustomLeftBtnWithTitle:(NSString *)title
{
    UIButton *backbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    backbutton.frame = CGRectMake(0, 0, 58, 28);
    [backbutton setTitle:title forState:UIControlStateNormal];
    [backbutton setTitleColor:NAVIGATION_BAR_TEXT_COLOR forState:UIControlStateNormal];
    [backbutton.titleLabel setFont:[UIFont systemFontOfSize:17]];
    [backbutton addTarget:self action:@selector(defaultPopView:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backbtnitem = [[UIBarButtonItem alloc] initWithCustomView:backbutton];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    // 调整在iOS7 下面的位置
    if(FDDKIsIos7){
        negativeSpacer.width = -10;
    }else{
        negativeSpacer.width = 0;
    }
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,backbtnitem, nil];
    return backbutton;
}

#pragma mark 设置左边的返回按钮
- (UIButton *)setCustomLeftBtnWithImageName:(NSString *)imageName
{
    UIButton *backbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    backbutton.frame = CGRectMake(0, 0, 32, 32);
    [backbutton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [backbutton addTarget:self action:@selector(defaultPopView:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backbtnitem = [[UIBarButtonItem alloc] initWithCustomView:backbutton];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    // 调整在iOS7 下面的位置
    if(FDDKIsIos7){
        negativeSpacer.width = -10;
    }else{
        negativeSpacer.width = 0;
    }
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,backbtnitem, nil];
    return backbutton;
}

#pragma mark 设置左边的返回按钮，并替换掉返回的方法
- (UIButton *)setCustomLeftBtnWithImageName:(NSString *)imageName backSEL:(SEL)backSEL
{
    UIButton *btn = [self setCustomLeftBtnWithImageName:imageName];
    if (backSEL != nil) {
        [btn removeTarget:self action:@selector(defaultPopView:) forControlEvents:UIControlEventTouchUpInside];
        [btn addTarget:self action:backSEL forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;
}

#pragma mark 设置右边按钮（仅带标题）
- (UIButton *)setCustomRightBtnWithTitle:(NSString *)title touchSelector:(SEL)touchSelector
{
    UIButton *rightbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightbutton.frame = CGRectMake(0, 0, 58, 28);
    [rightbutton setTitle:title forState:UIControlStateNormal];
    [rightbutton setTitleColor:NAVIGATION_BAR_TEXT_COLOR forState:UIControlStateNormal];
    [rightbutton.titleLabel setFont:[UIFont systemFontOfSize:16]];
    if (touchSelector!=nil) {
        [rightbutton addTarget:self action:touchSelector forControlEvents:UIControlEventTouchUpInside];
    }
    UIBarButtonItem *rightbtnitem = [[UIBarButtonItem alloc] initWithCustomView:rightbutton];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    // 调整在iOS7 下面的位置
    if(FDDKIsIos7){
        negativeSpacer.width = -10;
    }else{
        negativeSpacer.width = 0;
    }
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,rightbtnitem, nil];
    return rightbutton;
}

#pragma mark 设置右边的按钮
- (UIButton *)setCustomRightBtnWithImageName:(NSString *)imageName touchSelector:(SEL)touchSelector
{
    UIButton *rightbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightbtn.frame = CGRectMake(0, 0, 32, 32);
    [rightbtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [rightbtn addTarget:self action:touchSelector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightbtnitem = [[UIBarButtonItem alloc] initWithCustomView:rightbtn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    // 调整在iOS7 下面的位置
    if(FDDKIsIos7){
        negativeSpacer.width = -10;
    }else{
        negativeSpacer.width = 0;
    }
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,rightbtnitem, nil];
    return rightbtn;
}

#pragma mark 设置右边的按钮及尺寸
- (UIButton *)setCustomRightBtnWithImageName:(NSString *)imageName touchSelector:(SEL)touchSelector size:(CGSize)size
{
    UIButton *rightbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightbtn.frame = CGRectMake(0, 0, size.width, size.height);
    [rightbtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [rightbtn addTarget:self action:touchSelector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightbtnitem = [[UIBarButtonItem alloc] initWithCustomView:rightbtn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    // 调整在iOS7 下面的位置
    if(FDDKIsIos7){
        negativeSpacer.width = -10;
    }else{
        negativeSpacer.width = 0;
    }
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,rightbtnitem, nil];
    return rightbtn;
}

#pragma mark 设置右边的按钮及尺寸
- (UIView *)setCustomRight:(UIView *)customview
{
    UIBarButtonItem *rightbtnitem = [[UIBarButtonItem alloc] initWithCustomView:customview];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    // 调整在iOS7 下面的位置
    if(FDDKIsIos7){
        negativeSpacer.width = -10;
    }else{
        negativeSpacer.width = 0;
    }
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,rightbtnitem, nil];
    return customview;
}

#pragma mark - 默认返回上一页
- (void)defaultPopView:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 设置左边的返回按钮
- (UIButton *)setCustomLeftBtnWithImageName:(NSString *)imageName btnTitle:(NSString *)btnTitle
{
    UIButton *backbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    backbutton.frame = CGRectMake(0, 0, 200, 32);
    backbutton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [backbutton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [backbutton setTitle:btnTitle forState:UIControlStateNormal];
    [backbutton addTarget:self action:@selector(defaultPopView:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backbtnitem = [[UIBarButtonItem alloc] initWithCustomView:backbutton];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    // 调整在iOS7 下面的位置
    if(FDDKIsIos7){
        negativeSpacer.width = -10;
    }else{
        negativeSpacer.width = 0;
    }
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,backbtnitem, nil];
    return backbutton;
}

#pragma mark 更新返回按钮的title
- (void)refreshCustomLeftBtnTitle:(NSString *)title
{
    UIBarButtonItem *backbtnitem = [self.navigationItem.leftBarButtonItems objectAtIndex:1];
    UIButton *backbtn = (UIButton *)backbtnitem.customView;
    [backbtn setTitle:title forState:UIControlStateNormal];
}

#pragma mark 显示一个遮罩
- (void)showMaskViewOnMotherView:(UIView *)motherView maskType:(FDDEMaskViewType)maskType afterMaskViewCreateBlock:(void (^)(UIView *maskView))afterMaskViewCreateBlock touchMaskView:(TouchMaskViewBlock)touchMaskView
{
    self.touchMaskViewBlock = touchMaskView;
    
    float alpha = 0.0;
    float duration = 0.0;
    UIView *mask = [[UIView alloc] initWithFrame:motherView.bounds];
    mask.tag = 365;
    mask.alpha = alpha;
    if (maskType == FDDEMaskViewTypeGray) {
        mask.backgroundColor = [UIColor grayColor];
        alpha = 0.7;
        duration = 0.25;
    }else if(maskType == FDDEMaskViewTypeGlass){
        UIImage *darkImage = [[FDDUtils snapUIViewToImage:motherView] applyDarkEffect];
        mask.backgroundColor = [UIColor colorWithPatternImage:darkImage];
        alpha = 1.0;
        duration = 0.1;
    }
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = mask.bounds;
    [button addTarget:self action:@selector(touchMaskView:) forControlEvents:UIControlEventTouchUpInside];
    [mask addSubview:button];
    [motherView addSubview:mask];
    [motherView bringSubviewToFront:mask];
    
    [UIView animateWithDuration:duration animations:^{
        mask.alpha = alpha;
    } completion:^(BOOL finished) {
        afterMaskViewCreateBlock(mask);
    }];
}

- (void)touchMaskView:(id)sender
{
    self.touchMaskViewBlock();
    UIButton *btn = (UIButton *)sender;
    UIView *maskView = [btn superview];
    btn.enabled = NO;
    [maskView removeFromSuperview];
}

#pragma mark 隐藏一个遮罩
- (void)hideMaskView:(UIView *)motherView
{
    UIView *maskView = [motherView viewWithTag:365];
    if (maskView != nil) {
        [maskView removeFromSuperview];
    }
}

@end
