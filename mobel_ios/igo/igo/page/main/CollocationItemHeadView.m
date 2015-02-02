//
//  CollocationItemHeadView.m
//  igo
//
//  Created by DingYunYu on 15/1/6.
//  Copyright (c) 2015年 DingYunYu. All rights reserved.
//

#import "CollocationItemHeadView.h"

@interface CollocationItemHeadView ()

@property (strong, nonatomic) IBOutlet UIImageView *topImageView;
@property (strong, nonatomic) IBOutlet UIScrollView *itemScrollView;
@property (strong, nonatomic) NSMutableArray *itemsViewArray;

@end

@implementation CollocationItemHeadView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.itemScrollView.contentSize = CGSizeMake(320 * 3, 85);
}

- (void)fillItemScrollView:(NSMutableArray *)itemArray topImage:(NSString *)topImage
{
    if (self.itemsViewArray == nil || self.itemsViewArray.count == 0) {
        self.itemsViewArray = [[NSMutableArray alloc] init];
        self.topImageView.image = [UIImage imageNamed:topImage];
        int i = 0;
        for (NSString *imageName in itemArray) {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i*85, 0, 85, 85)];
            view.backgroundColor = [UIColor whiteColor];
            view.userInteractionEnabled = YES;
            
            UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(9, 9, 67, 67)];
            [view addSubview:imageview];
            
            imageview.image = [UIImage imageNamed:imageName];
            
            [self.itemScrollView addSubview:view];
            [self.itemsViewArray addObject:imageview];
            
            if (i != itemArray.count - 1) {
                UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCollocationImageView:)];
                [view addGestureRecognizer:singleTap];
            }else{
                UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickLastCollocationImageView:)];
                [view addGestureRecognizer:singleTap];
            }
            
            i++;
        }
        self.itemScrollView.contentSize = CGSizeMake(85*i, 85);
    }
}

- (void)clickCollocationImageView:(id)sender
{
    [self.delegate clickCollocationItem];
}

- (void)clickLastCollocationImageView:(id)sender
{
    [self.delegate clickLastCollocationImageView];
}

@end
