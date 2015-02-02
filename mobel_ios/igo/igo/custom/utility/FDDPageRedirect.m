//
//  FDDPageRedirect.m
//  KaiDanBao
//
//  Created by 麦家豪 on 14/10/20.
//  Copyright (c) 2014年 fangdiantong. All rights reserved.
//

#import "FDDPageRedirect.h"
#import "RegisterViewController.h"
#import "MyFavoriteViewController.h"
#import "MyMessageViewController.h"
#import "MineSuggestionViewController.h"
#import "NewsMessageViewController.h"
#import "SearchHeadViewDetailViewController.h"
#import "CollocationItemViewController.h"
#import "SingleItemViewController.h"
#import "CircumDetailViewController.h"

@implementation FDDPageRedirect

#pragma mark 跳转到注册
+(void)redirectToRegisterViewController:(UIViewController *)viewController
{
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    [viewController.navigationController pushViewController:registerVC animated:YES];
}

#pragma mark 跳转到我的收藏
+(void)redirectToMyFavoriteViewController:(UIViewController *)viewController
{
    MyFavoriteViewController *myFavoriteVC = [[MyFavoriteViewController alloc] init];
    [viewController.navigationController pushViewController:myFavoriteVC animated:YES];
}

#pragma mark 跳转到我的信息
+(void)redirectToMyMessageViewController:(UIViewController *)viewController
{
    MyMessageViewController *myMessVC = [[MyMessageViewController alloc] init];
    [viewController.navigationController pushViewController:myMessVC animated:YES];
}

#pragma mark 跳转到意见反馈
+(void)redirectToSuggestionViewController:(UIViewController *)viewController
{
    MineSuggestionViewController *suggestionVC = [[MineSuggestionViewController alloc] init];
    [viewController.navigationController pushViewController:suggestionVC animated:YES];
}

#pragma mark 跳转到新闻主页
+(void)redirectToNewsMessageViewController:(UIViewController *)viewController url:(NSString *)url
{
    NewsMessageViewController *newsMessageVC = [[NewsMessageViewController alloc] init];
    newsMessageVC.url = url;
    [viewController.navigationController pushViewController:newsMessageVC animated:YES];
}

#pragma mark 跳转到详情页
+(void)redirectToSearchHeadViewDetailViewController:(UIViewController *)viewController
{
    SearchHeadViewDetailViewController *searchDetailVC = [[SearchHeadViewDetailViewController alloc] init];
    [viewController.navigationController pushViewController:searchDetailVC animated:YES];
}

#pragma mark 跳转到搭配图
+(void)redirectToCollocationItemViewController:(UIViewController *)viewController
{
    CollocationItemViewController *collocationVC = [[CollocationItemViewController alloc] init];
    [viewController.navigationController pushViewController:collocationVC animated:YES];
}

#pragma mark 跳转到单品
+(void)redirectToSingleItemViewController:(UIViewController *)viewController
{
    SingleItemViewController *singleItemVC = [[SingleItemViewController alloc] init];
    [viewController.navigationController pushViewController:singleItemVC animated:YES];
}

#pragma mark 跳转到周边
+(void)redirectToCircumDetailViewController:(UIViewController *)viewController
{
    CircumDetailViewController *cirDetailVC = [[CircumDetailViewController alloc] init];
    [viewController.navigationController pushViewController:cirDetailVC animated:YES];
}

@end
