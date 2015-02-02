//
//  FDDMacros.h
//  papm
//
//  Created by dean on 13-11-19.
//  Copyright (c) 2013年 pingan. All rights reserved.
//
// 通用宏定义

#pragma mark - 调试

#define FDDMPrintFunctionName() NSLog(@"\n\n调用了：%s\n\n", __PRETTY_FUNCTION__)

#pragma mark - 图片
#define FDDKUIImageImageNamed(filename,type) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:filename ofType:type]]
#define FDDKUIImageImageNamedPng(filename) FDDKUIImageImageNamed(filename, @"png")


#pragma mark - 数学计算
//角度的转换
#define FDDKDegreeToRadians(degree) (M_PI *degree / 180.0)
//弧度的转换
#define FDDKRadiansToDegree(radians) (radians * 180 / M_PI)
//计算换行文字的高度
#define FDDKHeightForString(string,fontSize,width)  ([string sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(width,MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping].height)

#pragma mark - 硬件和软件参数获取
//判断iphone5
#define FDDKIsIphone5 (fabs((double)[[UIScreen mainScreen] bounds].size.height-(double)568 ) < DBL_EPSILON )
//判断ipad
#define FDDKIsPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//判断是否ios7
#define FDDKIsIos7 ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0)
//判断是否ios8
#define FDDKIsIos8 ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0)
//获取版本
#define FDDKSystemVersion ([[[UIDevice currentDevice] systemVersion] floatValue])
//判断是否模拟器
#define FDDKIsSimulator (NSNotFound != [[[UIDevice currentDevice] model] rangeOfString:@"Simulator"].location)
//获取开发者UUID
#define FDDKIdentifyVendor ([[[UIDevice currentDevice] identifierForVendor] UUIDString])


#pragma mark - 屏幕及坐标设计相关参数
#define FDDC_TAB_BAR_HEIGHT 49 //工具栏高度
#define FDDC_NAV_BAR_HEIGHT 44 //导航栏高度
#define FDDC_STATUS_BAR_HEIGHT 20 //status栏高度
#define FDDC_I5_I4_HEIGHTDIFFER 88 //i5和i4的屏幕的高度差

//屏幕整体高度
#define FDDKBoundsHeight ([[UIScreen mainScreen] currentMode].size.height/2)
//去掉状态栏的高度
#define FDDKBoundsHeightSubStatus ([[UIScreen mainScreen] currentMode].size.height/2-FDDC_STATUS_BAR_HEIGHT)
//去掉状态栏和导航栏高度
#define FDDKBoundsHeightSubStatusNav ([[UIScreen mainScreen] currentMode].size.height/2-FDDC_STATUS_BAR_HEIGHT-FDDC_NAV_BAR_HEIGHT)
//去掉状态栏和工具栏高度
#define FDDKBoundsHeightSubStatusTab ([[UIScreen mainScreen] currentMode].size.height/2-FDDC_STATUS_BAR_HEIGHT-FDDC_TAB_BAR_HEIGHT)
//去掉状态栏，工具栏，导航栏高度
#define FDDKBoundsHeightSubStatusNavTab ([[UIScreen mainScreen] currentMode].size.height/2-FDDC_STATUS_BAR_HEIGHT-FDDC_NAV_BAR_HEIGHT-FDDC_TAB_BAR_HEIGHT)

//设置新的坐标
#define FDDMFrameX(x,view) (view.frame = CGRectMake(x, view.frame.origin.y, view.frame.size.width, view.frame.size.height))
#define FDDMFrameY(y,view) (view.frame = CGRectMake(view.frame.origin.x, y, view.frame.size.width, view.frame.size.height))
#define FDDMFrameXY(x,y,view) (view.frame = CGRectMake(x, y, view.frame.size.width, view.frame.size.height))
#define FDDMFrameWidth(width,view) (view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, width, view.frame.size.height))
#define FDDMFrameHeight(height,view) (view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, height))
#define FDDMFrameWidthHeight(width,height,view) (view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, width, height))


#pragma mark - 网络相关
//获取NSURLRequest
#define FDDKNSURLRequestWithNSString(urlString) ([NSURLRequest requestWithURL:[NSURL URLWithString:(NSString *)urlString]])
//通过baseURL获取NSURLRequest
#define FDDKNSURLRequestWithNSStringByBaseURL(urlString) ([NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",FDDC_BASEURL,(NSString *)urlString]]])
//获取NSURL
#define FDDKNSURLWithNSString(urlString) ([NSURL URLWithString:(NSString *)urlString])
//通过baseURL获取NSURL的NSString
#define FDDKNStringWithNSStringByBaseURL(urlString) ([NSString stringWithFormat:@"%@/%@",FDDC_BASEURL,(NSString *)urlString])
//通过baseURL获取NSURL
#define FDDKNSURLWithNSStringByBaseURL(urlString) ([NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",FDDC_BASEURL,(NSString *)urlString]])
//判断是否有网络
#define FDDKIsConnect ([Reachability reachabilityWithHostName:(NSString *)FDDC_BASEURL].currentReachabilityStatus == NotReachable)
//查询成功隐藏下拉刷新的图标
#define FDDMHideSVPullWithSucc(scrollview) ([scrollview.pullToRefreshView performSelector:@selector(stopAnimating) withObject:nil afterDelay:1])
//查询失败隐藏下拉刷新的图标
#define FDDMHideSVPullWithFail(scrollview) ([scrollview.pullToRefreshView performSelector:@selector(stopAnimating) withObject:nil afterDelay:0])
//隐藏上推加载更多的图标
#define FDDMHideInfiniteScrollingView(scrollview) ([scrollview.infiniteScrollingView stopAnimating])
//查询现在的网络状态
#define FDDKNetStatus ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus])


#pragma mark - 文件相关
//寻找documents路径
#define FDDKSearchDocumentsPath(filename)([[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:filename])
//工程的主路径
#define FDDKSearchFileInMainBundleByNameAndType(filename,filetype) ([[NSBundle mainBundle] pathForResource:filename ofType:filetype])


#pragma mark - 时间相关
//获取当前时间的时间戳
#define FDDKNowtimeIntervalSince1970 ([[NSDate date] timeIntervalSince1970])


#pragma mark - 字符串
//去掉两边空格
#define FDDKTrimWhiteSpace(beforeTrim) ([beforeTrim stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]])
//字符串是否是空的或者是nil
#define FDDKIsNilOrEmptyString(myString) (myString == nil || [myString isEqualToString:@""])


#pragma mark - 其它
//提示错误信息
#define FDDMShowWrongMessageAlertView(content) [[[UIAlertView alloc] initWithTitle:@"提示" message:content delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show]
//获取全局代理
#define FDDKGlobalAppDelegate ((AppDelegate *)([UIApplication sharedApplication].delegate))
#define FDDKNotifactionDefaultCenter ([NSNotificationCenter defaultCenter])
//block弱引用
#define FDDM_Block_Weak __weak typeof (self)


#pragma mark - 本地缓存
//保存数据
#define FDDMUserDefaultsSetObject(key,value) \
[[NSUserDefaults standardUserDefaults] setObject:value forKey:key]; \
[[NSUserDefaults standardUserDefaults] synchronize]
//删除数据
#define FDDMUserDefaultsRemoveObject(key) \
[[NSUserDefaults standardUserDefaults] removeObjectForKey:key]; \
[[NSUserDefaults standardUserDefaults] synchronize]
//读取数据
#define FDDKUserDefaultsGetObject(key) ([[NSUserDefaults standardUserDefaults] objectForKey:key])


#pragma mark - 电话基本性能
//打电话
#define FDDMPhoneMakeCall(number) ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",number]]])
//发短信
#define FDDMPhoneSendSms(number) ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"sms://%@",number]]])
//发邮件
#define FDDMPhoneMailTo(number) ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"mailto://%@",number]]])



#pragma mark - 视图相关
#define FDDKLoadViewByNibName(nibName) ([[[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil] objectAtIndex:0])
#define FDDKViewHeight(view) (view.frame.size.height)
#define FDDKViewWidth(view) (view.frame.size.width)

#pragma mark - 色值相关
//将十六进制色值转换的宏
#define FDDKConvertColorBy0xHexRGB(rgbValue) ([UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0])
#define FDDKConvertColorBy0xHexRGBAlpha(rgbValue,a) ([UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)])

//将rgb转成颜色
#define FDDKConvertColorByRGB(r,g,b) ([UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1])
//将rgb和透明度转成颜色
#define FDDKConvertColorByRGBAlpha(r,g,b,a) ([UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)])

