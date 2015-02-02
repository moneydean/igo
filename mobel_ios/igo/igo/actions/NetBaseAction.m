//
//  NetBaseAction.m
//  UKuBang
//
//  Created by dean on 13-9-24.
//  Copyright (c) 2013年 dean. All rights reserved.
//

#import "NetBaseAction.h"
#import "FDDUtils.h"

@implementation NetBaseAction

#pragma mark - POST带有一个hub的请求
/**
 *\brief
 *POST带有一个hub的请求
 */
- (void)sendPostWithCommonHub:(const NSString*)url
                    paramDict:(NSDictionary *)paramDict
                      hubView:(UIView *)hubView
                      success:(void (^)(AFHTTPRequestOperation *operation, NSDictionary *responseDict))success
                      failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:hubView animated:YES];
    hub.labelText = FDDC_NET_WAIT_TIP;
    
    AFHTTPRequestOperationManager *manager = [self createAFHTTPRequestOperationManager];
    [manager.requestSerializer setValue:@"" forHTTPHeaderField:@""];
    
    [manager POST:(NSString *)url parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
            NSDictionary *resultdict = [self stringToDict:responseObject];
            [self commonProcessResult:resultdict processSucc:^{
                if (success) {
                    success(operation,resultdict);
                }
                [hub hide:YES afterDelay:FDDC_HUB_HIDE_DELAY];
            } processFail:^{
                if (failure) {
                    failure(operation,nil);
                }
                [hub hide:YES afterDelay:FDDC_HUB_HIDE_DELAY];
            }];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        hub.labelText = FDDC_NET_CONNET_WRONG;
        [hub hide:YES afterDelay:FDDC_HUB_HIDE_DELAY];
        if (failure) {
            failure(operation,error);
        }
        
    }];
}

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
                      failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:hubView animated:YES];
    hub.labelText = loadstring;
    
    AFHTTPRequestOperationManager *manager = [self createAFHTTPRequestOperationManager];
    [manager.requestSerializer setValue:@"" forHTTPHeaderField:@""];
    
    [manager POST:(NSString *)url parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *resultdict = [self stringToDict:responseObject];
        [self commonProcessResult:resultdict processSucc:^{
            if (success) {
                success(operation,resultdict);
            }
            hub.labelText = succstring;
            [hub hide:YES afterDelay:FDDC_HUB_HIDE_DELAY];
        } processFail:^{
            if (failure) {
                failure(operation,nil);
            }
            hub.labelText = failstring;
            [hub hide:YES afterDelay:FDDC_HUB_HIDE_DELAY];
        }];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        hub.labelText = FDDC_NET_CONNET_WRONG;
        [hub hide:YES afterDelay:FDDC_HUB_HIDE_DELAY];
        if (failure) {
            failure(operation,error);
        }
        
    }];
}


#pragma mark POST不带hub的请求
/**
 *\brief
 *POST不带hub的请求
 */
- (void)sendPostNoHub:(const NSString*)url
            paramDict:(NSDictionary *)paramDict
              success:(void (^)(AFHTTPRequestOperation *operation, NSDictionary *responseDict))success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [self createAFHTTPRequestOperationManager];
    [manager.requestSerializer setValue:@"" forHTTPHeaderField:@""];
    
    [manager POST:(NSString *)url parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *resultdict = [self stringToDict:responseObject];
        [self commonProcessResult:resultdict processSucc:^{
            if (success) {
                success(operation,resultdict);
            }
        } processFail:^{
            
        }];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
            failure(operation,error);
        }
        
    }];
}

#pragma mark POST不带hub的请求，如果登录有问题，会弹出登录框
/**
 *\brief
 *POST不带hub的请求，如果登录有问题，会弹出登录框
 */
- (void)sendPostNoHubAndCheckLogin:(const NSString*)url
                         paramDict:(NSDictionary *)paramDict
                       presentView:(UIView *)presentView
                           success:(void (^)(AFHTTPRequestOperation *operation, NSDictionary *responseDict))success
                           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [self createAFHTTPRequestOperationManager];
    [manager.requestSerializer setValue:@"" forHTTPHeaderField:@""];
    
    [manager POST:(NSString *)url parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *resultdict = [self stringToDict:responseObject];
        [self commonProcessResult:resultdict processSucc:^{
            if (success) {
                success(operation,resultdict);
            }
        } processFail:^{
            
        }];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(operation,error);
        }
    }];
}

#pragma mark - GET带有一个hub的请求
/**
 *\brief
 *GET带有一个hub的请求
 */
- (void)sendGetWithCommonHub:(const NSString*)url
                   paramDict:(NSDictionary *)paramDict
                     hubView:(UIView *)hubView
                     success:(void (^)(AFHTTPRequestOperation *operation, NSDictionary *responseDict))success
                     failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:hubView animated:YES];
    hub.labelText = FDDC_NET_WAIT_TIP;
    
    AFHTTPRequestOperationManager *manager = [self createAFHTTPRequestOperationManager];
    [manager.requestSerializer setValue:@"" forHTTPHeaderField:@""];
    
    [manager GET:(NSString *)url parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *resultdict = [self stringToDict:responseObject];
        [self commonProcessResult:resultdict processSucc:^{
            if (success) {
                success(operation,resultdict);
            }
            [hub hide:YES afterDelay:FDDC_HUB_HIDE_DELAY];
        } processFail:^{
            if (failure) {
                failure(operation,nil);
            }
            [hub hide:YES afterDelay:FDDC_HUB_HIDE_DELAY];
        }];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        hub.labelText = FDDC_NET_CONNET_WRONG;
        [hub hide:YES afterDelay:FDDC_HUB_HIDE_DELAY];
        if (failure) {
            failure(operation,error);
        }
    }];
}

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
                     failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:hubView animated:YES];
    hub.labelText = loadstring;
    
    AFHTTPRequestOperationManager *manager = [self createAFHTTPRequestOperationManager];
    [manager.requestSerializer setValue:@"" forHTTPHeaderField:@""];
    
    [manager GET:(NSString *)url parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *resultdict = [self stringToDict:responseObject];
        [self commonProcessResult:resultdict processSucc:^{
            if (success) {
                success(operation,resultdict);
            }
            hub.labelText = succstring;
            [hub hide:YES afterDelay:FDDC_HUB_HIDE_DELAY];
        } processFail:^{
            if (failure) {
                failure(operation,nil);
            }
            hub.labelText = failstring;
            [hub hide:YES afterDelay:FDDC_HUB_HIDE_DELAY];
        }];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        hub.labelText = FDDC_NET_CONNET_WRONG;
        [hub hide:YES afterDelay:FDDC_HUB_HIDE_DELAY];
        if (failure) {
            failure(operation,error);
        }
    }];
}


#pragma mark GET不带hub的请求
/**
 *\brief
 *GET不带hub的请求
 */
- (void)sendGetNoHub:(const NSString*)url
           paramDict:(NSDictionary *)paramDict
             success:(void (^)(AFHTTPRequestOperation *operation, NSDictionary *responseDict))success
             failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [self createAFHTTPRequestOperationManager];
    [manager.requestSerializer setValue:@"" forHTTPHeaderField:@""];
    
    [manager GET:(NSString *)url parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *resultdict = [self stringToDict:responseObject];
        [self commonProcessResult:resultdict processSucc:^{
            if (success) {
                success(operation,resultdict);
            }
        } processFail:^{
            
        }];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(operation,error);
        }
    }];
}


#pragma mark GET不带hub的请求，如果登录有问题，会弹出登录框
/**
 *\brief
 *GET不带hub的请求，如果登录有问题，会弹出登录框
 */
- (void)sendGetNoHubAndCheckLogin:(const NSString*)url
                        paramDict:(NSDictionary *)paramDict
                      presentView:(UIView *)presentView
                          success:(void (^)(AFHTTPRequestOperation *operation, NSDictionary *responseDict))success
                          failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [self createAFHTTPRequestOperationManager];
    [manager.requestSerializer setValue:@"" forHTTPHeaderField:@""];
    
    [manager GET:(NSString *)url parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *resultdict = [self stringToDict:responseObject];
        [self commonProcessResult:resultdict processSucc:^{
            if (success) {
                success(operation,resultdict);
            }
        } processFail:^{
            
        }];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(operation,error);
        }
    }];
}

#pragma mark - 创建请求对象
- (AFHTTPRequestOperationManager *)createAFHTTPRequestOperationManager
{
    NSURL *baseURL = [NSURL URLWithString:(NSString *)FDDC_BASEURL];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    manager.requestSerializer.timeoutInterval = FDDC_REQUEST_TIMEOUT;
    return manager;
}

#pragma mark 将结果转成Dict
- (NSDictionary *)stringToDict:(NSData *)responseObject
{
    NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
    NSDictionary *resultdict = [result objectFromJSONString];
    return resultdict;
}

#pragma mark 通用的结果处理
- (BOOL)commonProcessResult:(NSDictionary *)resultDict
                    processSucc:(void (^)())processSucc
                    processFail:(void (^)())processFail
{
    return resultDict != nil;
}

@end
