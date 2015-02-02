//
//  MyMessageViewController.m
//  igo
//
//  Created by DingYunYu on 14/12/23.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "MyMessageViewController.h"
#import "MineMessageModel.h"
#import "MyMessageCell.h"

@interface MyMessageViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *myMessageTableView;
@property (strong, nonatomic) NSMutableArray *messageDataSource;

@end

@implementation MyMessageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setCustomLeftBtnWithImageName:FDDC_IMAGE_NAV_BACK];
    [self setCustomTitleLabel:@"我的信息"];
    [self createVirtualData];
    UINib *messageCellNib = [UINib nibWithNibName:@"MyMessageCell" bundle:nil];
    [self.myMessageTableView registerNib:messageCellNib forCellReuseIdentifier:@"messageCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 创建虚拟数据
- (void)createVirtualData
{
    self.messageDataSource = [[NSMutableArray alloc] init];
    for (int i = 0; i < 30; i++) {
        MineMessageModel *mineModel = [[MineMessageModel alloc] init];
        mineModel.imageURL = @"demo_message";
        mineModel.title = @"萧敬腾退出演艺圈，转入科学界，研究人工降雨，目标直取下一辈诺贝尔奖";
        mineModel.date = [NSDate date];
        [self.messageDataSource addObject:mineModel];
    }
}

#pragma mark 表格的数据源和代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageDataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyMessageCell *messCell = [tableView dequeueReusableCellWithIdentifier:@"messageCell" forIndexPath:indexPath];
    messCell.selectionStyle = UITableViewCellSelectionStyleNone;
    [messCell fillCellContentWithModel:[self.messageDataSource objectAtIndex:indexPath.row]];
    return messCell;
}



@end
