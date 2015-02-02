//
//  SingleItemViewController.m
//  igo
//
//  Created by DingYunYu on 15/1/12.
//  Copyright (c) 2015年 DingYunYu. All rights reserved.
//

#import "SingleItemViewController.h"
#import "SingleItemHeadView.h"

@interface SingleItemViewController ()<UITableViewDataSource,UITableViewDelegate,UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *singleItemTableView;
@property (strong, nonatomic) SingleItemHeadView *singleItemHeadView;

@end

@implementation SingleItemViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setCustomTitleLabel:@"大头皮鞋"];
    [self setCustomLeftBtnWithImageName:FDDC_IMAGE_NAV_BACK];
    [self setCustomRightBtnWithImageName:@"home_share" touchSelector:@selector(share)];
    
    self.singleItemHeadView = FDDKLoadViewByNibName(@"SingleItemHeadView");
    [self.singleItemHeadView fillHeadViewWith:@"demo_single_item" itemDesc:@"货号：9603 品牌：美国品牌 鞋头款式：圆头闭合方式套脚 鞋底材质：橡胶 鞋面材质：真皮头层皮" brand:@"Gucci"];
    [self.view addSubview:self.singleItemHeadView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 表格的数据源和代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.view.bounds.size.height - 190;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellidentify = @"singleItemCellIdentify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentify];
        
        UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        webView.delegate = self;
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
        [cell.contentView addSubview:webView];
    }
    return cell;
}

- (void)share
{
    FDDMPrintFunctionName();
}

@end
