//
//  MineSuggestionViewController.m
//  igo
//
//  Created by DingYunYu on 14/12/23.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "MineSuggestionViewController.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "FDDRoundCornersButton.h"

@interface MineSuggestionViewController ()

@property (strong, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UITextView *suggestionTextView;

@end

@implementation MineSuggestionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setCustomTitleLabel:@"意见反馈"];
    [self setCustomLeftBtnWithImageName:FDDC_IMAGE_NAV_BACK];
    [self createRegisterBtn];
    
    self.suggestionTextView.layer.borderColor = [FDDKConvertColorBy0xHexRGB(0xBCBCBC) CGColor];
    self.suggestionTextView.layer.borderWidth = 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 创建提交按钮
- (void)createRegisterBtn
{
    FDDRoundCornersButton *submitbtn = [[FDDRoundCornersButton alloc] initWithFrame:CGRectMake(112, 194, 96, 28) corners:5 backGroundColor:FDDKConvertColorBy0xHexRGB(0xE6A7B5)];
    [submitbtn setTitle:@"提交" forState:UIControlStateNormal];
    [submitbtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    submitbtn.titleLabel.textColor = FDDKConvertColorBy0xHexRGB(0x70323F);
    [self.scrollView addSubview:submitbtn];
    [submitbtn addTarget:self action:@selector(submitSuggestion:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark 提交
- (void)submitSuggestion:(id)sender
{
    
}

@end
