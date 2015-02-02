//
//  FDDPageRedirect.h
//  KaiDanBao
//
//  Created by 麦家豪 on 14/10/20.
//  Copyright (c) 2014年 fangdiantong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FDDPageRedirect : NSObject

#pragma mark 跳转到注册
+(void)redirectToRegisterViewController:(UIViewController *)viewController;

#pragma mark 跳转到我的收藏
+(void)redirectToMyFavoriteViewController:(UIViewController *)viewController;

#pragma mark 跳转到我的信息
+(void)redirectToMyMessageViewController:(UIViewController *)viewController;

#pragma mark 跳转到意见反馈
+(void)redirectToSuggestionViewController:(UIViewController *)viewController;

#pragma mark 跳转到新闻主页
+(void)redirectToNewsMessageViewController:(UIViewController *)viewController url:(NSString *)url;

#pragma mark 跳转到详情页
+(void)redirectToSearchHeadViewDetailViewController:(UIViewController *)viewController;

#pragma mark 跳转到搭配图
+(void)redirectToCollocationItemViewController:(UIViewController *)viewController;

#pragma mark 跳转到单品
+(void)redirectToSingleItemViewController:(UIViewController *)viewController;

#pragma mark 跳转到周边
+(void)redirectToCircumDetailViewController:(UIViewController *)viewController;


@end
