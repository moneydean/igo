//
//  FDDRoundCornersButton.m
//  igo
//
//  Created by DingYunYu on 14/12/22.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "FDDRoundCornersButton.h"

@implementation FDDRoundCornersButton

- (id)initWithFrame:(CGRect)frame
            corners:(float)corners
    backGroundColor:(UIColor *)backGroundColor
{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = corners;
        self.backgroundColor = backGroundColor;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
            corners:(float)corners
    backGroundColor:(UIColor *)backGroundColor
        borderColor:(UIColor *)borderColor
        borderWidth:(float)borderWidth
{
    self = [self initWithFrame:frame corners:corners backGroundColor:backGroundColor];
    self.layer.borderColor = [borderColor CGColor];
    self.layer.borderWidth = borderWidth;
    return self;
}

@end
