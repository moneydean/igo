//
//  FDDCustomDataAnalyseView.m
//  NetVote
//
//  Created by DingYunYu on 14-9-1.
//  Copyright (c) 2014年 Lin Dongpeng. All rights reserved.
//

#import "FDDCustomDataAnalyseButton.h"

@implementation FDDCustomDataAnalyseButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)fillViewByTitle:(NSString *)title
{
    for (UIView *view in [self subviews]) {
        [view removeFromSuperview];
    }
    
    self.backgroundColor = [UIColor clearColor];
    
    UIImageView *bgimageview = [[UIImageView alloc] initWithFrame:self.bounds];
    bgimageview.image = [UIImage imageNamed:@"data_analyse_bg_btn"];
    [self addSubview:bgimageview];
    
    CGSize size = [title sizeWithFont:[UIFont systemFontOfSize:12]];
    
    UILabel *titlelabel = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width - size.width - 24 + 10)/2, 7, size.width, 12)];//加10的原因是因为切图的image是24宽度，但是实际上图片本身只需要占用14宽度就够了。导致如果直接减少24，会无法居中
    titlelabel.backgroundColor = [UIColor clearColor];
    titlelabel.font = [UIFont systemFontOfSize:12];
    titlelabel.text = title;
    titlelabel.textColor = [UIColor colorWithRed:0 green:0.54 blue:0.96 alpha:1];
    [self addSubview:titlelabel];
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(titlelabel.frame.size.width + titlelabel.frame.origin.x - 5, 1, 24, 24)];//减5的原因和上面加10差不多
    imageview.image = [UIImage imageNamed:@"icon_button_choose"];
    [self addSubview:imageview];
}

- (void)addTouchEventBlock:(TouchAnalyseButtonBlock)block
{
    self.touchAnalyseButtonBlock = block;
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchAnalyseButton)];
    [self addGestureRecognizer:singleTap];
}

- (void)touchAnalyseButton
{
    self.touchAnalyseButtonBlock();
}

@end
