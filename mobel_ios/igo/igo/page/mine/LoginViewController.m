//
//  LoginViewController.m
//  igo
//
//  Created by DingYunYu on 14/12/19.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "LoginViewController.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "FDDRoundCornersButton.h"
#import "FDDPageRedirect.h"

@interface LoginViewController ()

@property (strong, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *loginScrollView;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setCustomTitleLabel:@"登录"];
    [self setCustomLeftBtnWithImageName:FDDC_IMAGE_NAV_BACK backSEL:@selector(dismissLoginVC:)];
    [self createLoginBtn];
    [self createRegisterBtn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 创建登录按钮
- (void)createLoginBtn
{
    FDDRoundCornersButton *loginbtn = [[FDDRoundCornersButton alloc] initWithFrame:CGRectMake(42, 96, 96, 28) corners:5 backGroundColor:FDDKConvertColorBy0xHexRGB(0xE6A7B5)];
    [loginbtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginbtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    loginbtn.titleLabel.textColor = FDDKConvertColorBy0xHexRGB(0x70323F);
    [self.loginScrollView addSubview:loginbtn];
    [loginbtn addTarget:self action:@selector(loginUser:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark 创建注册按钮
- (void)createRegisterBtn
{
    FDDRoundCornersButton *registerbtn = [[FDDRoundCornersButton alloc] initWithFrame:CGRectMake(180, 96, 96, 28) corners:5 backGroundColor:FDDKConvertColorBy0xHexRGB(0xD3D3D3)];
    [registerbtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerbtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    registerbtn.titleLabel.textColor = FDDKConvertColorBy0xHexRGB(0x343434);
    [self.loginScrollView addSubview:registerbtn];
    [registerbtn addTarget:self action:@selector(registerUser:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark 取消登录
- (void)dismissLoginVC:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark 登录
- (void)loginUser:(id)sender
{
    FDDMPrintFunctionName();
}

#pragma mark 注册
- (void)registerUser:(id)sender
{
    [FDDPageRedirect redirectToRegisterViewController:self];
}

@end
