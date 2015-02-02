//
//  NetBaseAction.h
//  UKuBang
//
//  Created by dean on 13-9-24.
//  Copyright (c) 2013年 dean. All rights reserved.
//
//  网络请求的基类

#import <Foundation/Foundation.h>

#define FDDC_REQUEST_TIMEOUT     15 //请求的超时时间
#define FDDC_HUB_HIDE_DELAY      1  //隐藏加载进度提示的延迟时间
#define FDDC_NET_CONNET_WRONG    @"网络连接错误" //网络连接错误的提示文字
#define FDDC_NET_WAIT_TIP        @"加载中"  //加载的提示文字

@interface NetBaseAction : NSObject

#pragma mark - POST带有一个hub的请求
/**
 *\brief
 *POST带有一个hub的请求
 */
- (void)sendPostWithCommonHub:(const NSString*)url
                    paramDict:(NSDictionary *)paramDict
                      hubView:(UIView *)hubView
                      success:(void (^)(AFHTTPRequestOperation *operation, NSDictionary *responseDict))success
                      failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

#pragma mark POST带有一个hub的请求，可自定义提示语
/**
 *\brief
 *POST带有一个hub的请求，可自定义提示语
 */
- (void)sendPostWithCommonHub:(const NSString*)url
                    paramDict:(NSDictionary *)paramDict
                      hubView:(UIView *)hubView
                   loadstring:(NSString *)loadstring
                   succstring:(NSString *)succstring
                   failstring:(NSString *)failstring
                      success:(void (^)(AFHTTPRequestOperation *operation, NSDictionary *responseDict))success
                      failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;


#pragma mark POST不带hub的请求
/**
 *\brief
 *POST不带hub的请求
 */
- (void)sendPostNoHub:(const NSString*)url
            paramDict:(NSDictionary *)paramDict
              success:(void (^)(AFHTTPRequestOperation *operation, NSDictionary *responseDict))success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;


#pragma mark POST不带hub的请求，如果登录有问题，会弹出登录框
/**
 *\brief
 *POST不带hub的请求，如果登录有问题，会弹出登录框
 */
- (void)sendPostNoHubAndCheckLogin:(const NSString*)url
                         paramDict:(NSDictionary *)paramDict
                       presentView:(UIView *)presentView
                           success:(void (^)(AFHTTPRequestOperation *operation, NSDictionary *responseDict))success
                           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;


#pragma mark - GET带有一个hub的请求
/**
 *\brief
 *GET带有一个hub的请求
 */
- (void)sendGetWithCommonHub:(const NSString*)url
                   paramDict:(NSDictionary *)paramDict
                     hubView:(UIView *)hubView
                     success:(void (^)(AFHTTPRequestOperation *operation, NSDictionary *responseDict))success
                     failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

#pragma mark GET带有一个hub的请求，可自定义提示语
/**
 *\brief
 *GET带有一个hub的请求，可自定义提示语
 */
- (void)sendGetWithCommonHub:(const NSString*)url
                   paramDict:(NSDictionary *)paramDict
                     hubView:(UIView *)hubView
                  loadstring:(NSString *)loadstring
                  succstring:(NSString *)succstring
                  failstring:(NSString *)failstring
                     success:(void (^)(AFHTTPRequestOperation *operation, NSDictionary *responseDict))success
                     failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;


#pragma mark GET不带hub的请求
/**
 *\brief
 *GET不带hub的请求
 */
- (void)sendGetNoHub:(const NSString*)url
           paramDict:(NSDictionary *)paramDict
             success:(void (^)(AFHTTPRequestOperation *operation, NSDictionary *responseDict))success
             failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;


#pragma mark GET不带hub的请求，如果登录有问题，会弹出登录框
/**
 *\brief
 *GET不带hub的请求，如果登录有问题，会弹出登录框
 */
- (void)sendGetNoHubAndCheckLogin:(const NSString*)url
                        paramDict:(NSDictionary *)paramDict
                      presentView:(UIView *)presentView
                          success:(void (^)(AFHTTPRequestOperation *operation, NSDictionary *responseDict))success
                          failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
