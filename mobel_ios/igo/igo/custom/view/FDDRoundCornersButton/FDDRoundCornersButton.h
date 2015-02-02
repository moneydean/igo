//
//  FDDRoundCornersButton.h
//  igo
//
//  Created by DingYunYu on 14/12/22.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FDDRoundCornersButton : UIButton

- (id)initWithFrame:(CGRect)frame
            corners:(float)corners
    backGroundColor:(UIColor *)backGroundColor;

- (id)initWithFrame:(CGRect)frame
            corners:(float)corners
    backGroundColor:(UIColor *)backGroundColor
        borderColor:(UIColor *)borderColor
        borderWidth:(float)borderWidth;

@end
