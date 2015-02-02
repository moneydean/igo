//
//  RegisterViewController.m
//  igo
//
//  Created by DingYunYu on 14/12/19.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "RegisterViewController.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "FDDRoundCornersButton.h"

@interface RegisterViewController ()

@property (strong, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *registerScrollView;

@end

@implementation RegisterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setCustomTitleLabel:@"注册"];
    [self setCustomLeftBtnWithImageName:FDDC_IMAGE_NAV_BACK];
    [self createRegisterBtn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 创建注册按钮
- (void)createRegisterBtn
{
    FDDRoundCornersButton *registerbtn = [[FDDRoundCornersButton alloc] initWithFrame:CGRectMake(112, 136, 96, 28) corners:5 backGroundColor:FDDKConvertColorBy0xHexRGB(0xE6A7B5)];
    [registerbtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerbtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    registerbtn.titleLabel.textColor = FDDKConvertColorBy0xHexRGB(0x70323F);
    [self.registerScrollView addSubview:registerbtn];
    [registerbtn addTarget:self action:@selector(registerUser:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark 注册
- (void)registerUser:(id)sender
{
    FDDMPrintFunctionName();
}

@end
