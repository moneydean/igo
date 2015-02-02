//
//  FDDUtils.h
//  heros
//
//  Created by dean on 13-11-19.
//  Copyright (c) 2013年 greatwisdom. All rights reserved.
//
// 所有项目通用的工具类

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <UIKit/UIKit.h>

@interface FDDUtils : NSObject

#pragma mark - 视图部分
#pragma mark 将所有Navigation退到首页
+ (void)popAllNavgationToRoot:(UITabBarController *)tabBarController animated:(BOOL)animated;

#pragma mark  获取指定名称的responder
+ (UIResponder *)getNextResponder:(id)sender className:(Class)className;

#pragma mark 给UIView进行截图
+ (UIImage *)snapUIViewToImage:(UIView *)view;

#pragma mark 指定UIView的某几个角为圆角
+ (void)makeCornerRadiusForView:(UIView *)view roundingCorners:(UIRectCorner)rectCorner cornerRad:(CGSize)size;

#pragma mark 获取当前controller的上级controller
+ (UIViewController*)getBrotherViewController:(UINavigationController *)nav sourceControler:(id)sourceControler;

#pragma mark 获取指定名称的同一nav下的上个窗口
+ (UIViewController*)getViewControllerfromNav:(UINavigationController*)nav className:(Class)className;

#pragma mark 显示一个带信息的提示
+ (void)showTipMessageWithHub:(UIView *)view resultStatus:(BOOL)resultStatus tipMessage:(NSString *)tipMessage;

#pragma mark 显示一个带延迟的提示
+ (void)showTipMessageWithHub:(UIView *)view resultStatus:(BOOL)resultStatus tipMessage:(NSString *)tipMessage time:(double)time;

#pragma mark 显示一个带信息的提示后运行block
+ (void)showTipMessageWithHub:(UIView *)view resultStatus:(BOOL)resultStatus tipMessage:(NSString *)tipMessage completion:(void (^)())completion;

#pragma mark 显示一个带延迟的提示后运行block
+ (void)showTipMessageWithHub:(UIView *)view resultStatus:(BOOL)resultStatus tipMessage:(NSString *)tipMessage time:(double)time completion:(void (^)(void))completion;

#pragma mark - md5
#pragma mark 32位加密 （大写）
+ (NSString *)md5With32:(NSString *)str;

#pragma mark md5 16位加密 （大写）
+ (NSString *)md5With16:(NSString *)str;



#pragma mark - 日期和时间
#pragma mark 时间戳转时间
+ (NSString *)timeIntervalToTimeString:(NSString *)formatterString time:(long long)time;

#pragma mark 时间转时间戳
+ (long long)timeStringToTimeInterval:(NSString *)formatterString timeString:(NSString *)timeString;

#pragma mark 时间戳转换成hh:mi'ss"格式
+ (NSString *)timeIntervalToHHMISS:(double)time;

#pragma mark - 文件
#pragma mark 将相簿照片保存到本地缓存一份，以便上传时拿到localPath，返回值为本地path
+ (NSString*)saveAssetToLocal:(ALAsset*)alasset localPath:(NSString *)localPath fileName:(NSString *)fileName;

#pragma mark 创建本地文件夹
+ (NSString *)createOrFindLocalFolder:(NSString *)path;

#pragma mark 压缩照片尺寸
+ (UIImage*)imageByScalingForSize:(CGSize)targetSize image:(UIImage *)image;

#pragma makr 删除一个本地的文件
+ (BOOL)removeFileInLocalPath:(NSString *)localPath;

@end
