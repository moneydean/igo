//
//  UIBaseWebViewController.h
//  NetVote
//
//  Created by DingYunYu on 14-8-5.
//  Copyright (c) 2014年 Lin Dongpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIBaseViewController.h"

@interface UIBaseWebViewController : UIBaseViewController<UIWebViewDelegate>

@property (strong, nonatomic) NSString *url;

@end
