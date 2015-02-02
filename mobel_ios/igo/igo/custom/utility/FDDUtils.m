//
//  FDDUtils.m
//  heros
//
//  Created by dean on 13-11-19.
//  Copyright (c) 2013年 greatwisdom. All rights reserved.
//

#import "FDDUtils.h"

@implementation FDDUtils

#pragma mark - 视图部分
#pragma mark 将所有Navigation退到首页
+ (void)popAllNavgationToRoot:(UITabBarController *)tabBarController animated:(BOOL)animated
{
    NSArray *navarr = tabBarController.viewControllers;
    for (UINavigationController *nav in navarr) {
        [nav popToRootViewControllerAnimated:animated];
    }
}

#pragma mark  获取指定名称的responder
+ (UIResponder *)getNextResponder:(id)sender className:(Class)className
{
    id findobj = nil;
    UIResponder* responder = (UIResponder*)sender;
    while (responder) {
        responder = responder.nextResponder;
        if ([responder isKindOfClass:className]) {
            findobj = responder;
            break;
        }
    }
    return responder;
}

#pragma mark 给UIView进行截图
+ (UIImage *)snapUIViewToImage:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
    
    //获取图像
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark 指定UIView的某几个角为圆角
+ (void)makeCornerRadiusForView:(UIView *)view roundingCorners:(UIRectCorner)rectCorner cornerRad:(CGSize)size
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:rectCorner cornerRadii:size];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
}

#pragma mark 获取当前controller的上级controller
+ (UIViewController*)getBrotherViewController:(UINavigationController *)nav sourceControler:(id)sourceControler
{
    int i = 0;
    for (UIViewController *vc in nav.viewControllers) {
        if (vc == sourceControler) {
            break;
        }
        i++;
    }
    
    if (i == 0 || i == nav.viewControllers.count) {
        return nil;
    }
    
    return [nav.viewControllers objectAtIndex:i-1];
}

#pragma mark 获取指定名称的同一nav下的上个窗口
+ (UIViewController*)getViewControllerfromNav:(UINavigationController*)nav className:(Class)className
{
    for (long i = nav.viewControllers.count - 1; i >= 0; i--) {
        UIViewController* vc = [nav.viewControllers objectAtIndex:i];
        
        if ([vc isKindOfClass:className]) {
            return vc;
        }
    }
    
    return nil;
}

#pragma mark 显示一个带信息的提示
+ (void)showTipMessageWithHub:(UIView *)view resultStatus:(BOOL)resultStatus tipMessage:(NSString *)tipMessage;
{
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hub.mode = MBProgressHUDModeCustomView;
    if (resultStatus) {
        hub.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_right"]];
    }else{
        hub.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_wrong"]];
    }
    hub.labelText = tipMessage;
    [hub hide:YES afterDelay:1];
}

#pragma mark 显示一个带延迟的提示
+ (void)showTipMessageWithHub:(UIView *)view resultStatus:(BOOL)resultStatus tipMessage:(NSString *)tipMessage time:(double)time
{
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hub.mode = MBProgressHUDModeCustomView;
    if (resultStatus) {
        hub.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_right"]];
    }else{
        hub.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_wrong"]];
    }
    hub.labelText = tipMessage;
    [hub hide:YES afterDelay:time];
}

#pragma mark 显示一个带信息的提示后运行block
+ (void)showTipMessageWithHub:(UIView *)view resultStatus:(BOOL)resultStatus tipMessage:(NSString *)tipMessage completion:(void (^)())completion;
{
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hub.mode = MBProgressHUDModeCustomView;
    if (resultStatus) {
        hub.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_right"]];
    }else{
        hub.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_wrong"]];
    }
    hub.labelText = tipMessage;
    [hub hide:YES afterDelay:1];
    if(completion){
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1.1 * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            completion();
        });
    }
}

#pragma mark 显示一个带延迟的提示后运行block
+ (void)showTipMessageWithHub:(UIView *)view resultStatus:(BOOL)resultStatus tipMessage:(NSString *)tipMessage time:(double)time completion:(void (^)(void))completion;
{
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hub.mode = MBProgressHUDModeCustomView;
    if (resultStatus) {
        hub.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_right"]];
    }else{
        hub.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_wrong"]];
    }
    hub.labelText = tipMessage;
    [hub hide:YES afterDelay:time];
    if(completion){
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (time+0.1) * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            completion();
        });
    }
}


#pragma mark - md5

#pragma mark 32位加密 （大写）
+ (NSString *)md5With32:(NSString *)str
{
    const char* utf8str = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(utf8str, (CC_LONG)strlen(utf8str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}


#pragma mark md5 16位加密 （大写）
+ (NSString *)md5With16:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]];
}

#pragma mark - 日期和时间
#pragma mark 时间戳转时间
+ (NSString *)timeIntervalToTimeString:(NSString *)formatterString time:(long long)time
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatterString];
    return [formatter stringFromDate:date];
}

#pragma mark 时间转时间戳
+ (long long)timeStringToTimeInterval:(NSString *)formatterString timeString:(NSString *)timeString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatterString];
    NSDate *date = [formatter dateFromString:timeString];
    return [date timeIntervalSince1970];
}

#pragma mark 时间戳转换成hh:mi'ss"格式
+ (NSString *)timeIntervalToHHMISS:(double)time
{
    long seconds = (long)time;
    
    int h = (int)(seconds / 3600); // 时
    int m = (int)((seconds % 3600) / 60); // 分
    int s = seconds % 60;
    
    NSString *h_str = h<10?[NSString stringWithFormat:@"0%d",h]:[NSString stringWithFormat:@"%d",h];
    NSString *m_str = m<10?[NSString stringWithFormat:@"0%d",m]:[NSString stringWithFormat:@"%d",m];
    NSString *s_str = s<10?[NSString stringWithFormat:@"0%d",s]:[NSString stringWithFormat:@"%d",s];
    
    NSString* timeString;
    if (h > 0) {
        timeString = [NSString stringWithFormat:@"%@:%@'%@\"", h_str, m_str, s_str];
    } else {
        timeString = [NSString stringWithFormat:@"%@'%@\"", m_str, s_str];
    }
    
    return timeString;
}

#pragma mark - 文件
#pragma mark 将相簿照片保存到本地缓存一份，以便上传时拿到localPath，返回值为本地path
+ (NSString*)saveAssetToLocal:(ALAsset*)alasset localPath:(NSString *)localPath fileName:(NSString *)fileName
{
    ALAssetRepresentation* ar = [alasset defaultRepresentation];
    UIImage* fullImage = [UIImage imageWithCGImage:[ar fullResolutionImage]];
    
    NSString *savePath = FDDKSearchDocumentsPath(localPath);
    NSString* imagePath = [NSString stringWithFormat:@"%@/%@", savePath, fileName];
    
    [UIImageJPEGRepresentation(fullImage, 0.3) writeToFile:imagePath atomically:YES];
    
    return imagePath;
}

#pragma mark 创建本地文件夹
+ (NSString *)createOrFindLocalFolder:(NSString *)path
{
    NSString *folderPathString = FDDKSearchDocumentsPath(path);
    // 如果没有此文件夹则创建
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    BOOL isDir;
    if (![fileManager fileExistsAtPath:folderPathString isDirectory:&isDir]) {
        
        // 创建
        NSError* error;
        [fileManager createDirectoryAtPath:folderPathString
               withIntermediateDirectories:YES //同时创建不存在的父目录
                                attributes:nil
                                     error:&error];
        
    } else {
        
        if (isDir){
            
        }else{
            
        }
        
    }
    
    return folderPathString;
}


#pragma mark 压缩照片尺寸
+ (UIImage*)imageByScalingForSize:(CGSize)targetSize image:(UIImage *)image
{
    UIImage *sourceImage = image;
    
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO){
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if (widthFactor > heightFactor){
            scaleFactor = widthFactor; // scale to fit height
        }else{
            scaleFactor = heightFactor; // scale to fit width
        }
        
        scaledWidth= width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor){
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }else if (widthFactor < heightFactor){
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContext(targetSize); // this will crop
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width= scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    [sourceImage drawInRect:thumbnailRect];
    
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    if ( scaledImage == nil ){
        NSLog(@"UIImageRetinal:could not scale image!!!");
        return nil;
    }
    
    UIGraphicsEndImageContext();
    
    return scaledImage;
    
}

#pragma makr 删除一个本地的文件
+ (BOOL)removeFileInLocalPath:(NSString *)localPath
{
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    BOOL isDir;
    if ([fileManager fileExistsAtPath:localPath isDirectory:&isDir]) {
        NSError* error;
        return [fileManager removeItemAtPath:localPath error:&error];
    }
    return NO;
}

@end
