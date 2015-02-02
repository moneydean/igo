//
//  AppDelegate.m
//  igo
//
//  Created by DingYunYu on 14/12/3.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import "AppDelegate.h"
#import "MainPageViewController.h"
#import "FDDCustomNavigationBar.h"
#import "HotPageViewController.h"
#import "MineMainPageViewController.h"
#import "NewsMainPageViewController.h"
#import "SearchMainPageViewController.h"
#import "MLNavigationController.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self initWindow];
    [self initStatusBar];
    self.window.rootViewController = [self createRDVCustomTabbar];
    [self customizeInterface];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark 初始化window
- (void)initWindow
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

#pragma mark 创建tabbar和navigationbar
- (RDVTabBarController *)createRDVCustomTabbar
{
    //首页
    MainPageViewController *mainPage = [[MainPageViewController alloc] init];
    MLNavigationController *mainNav = [[MLNavigationController alloc] initWithNavigationBarClass:[FDDCustomNavigationBar class] toolbarClass:nil];
    mainNav.viewControllers = [NSArray arrayWithObjects:mainPage,nil];
    
    NewsMainPageViewController *newsPage = [[NewsMainPageViewController alloc] init];
    MLNavigationController *newsNav = [[MLNavigationController alloc] initWithNavigationBarClass:[FDDCustomNavigationBar class] toolbarClass:nil];
    newsNav.viewControllers = [NSArray arrayWithObjects:newsPage,nil];
    
    SearchMainPageViewController *searchPage = [[SearchMainPageViewController alloc] init];
    MLNavigationController *searchNav = [[MLNavigationController alloc] initWithNavigationBarClass:[FDDCustomNavigationBar class] toolbarClass:nil];
    searchNav.viewControllers = [NSArray arrayWithObjects:searchPage,nil];
    
    HotPageViewController *hotPage = [[HotPageViewController alloc] init];
    MLNavigationController *hotNav = [[MLNavigationController alloc] initWithNavigationBarClass:[FDDCustomNavigationBar class] toolbarClass:nil];
    hotNav.viewControllers = [NSArray arrayWithObjects:hotPage,nil];
    
    MineMainPageViewController *minePage = [[MineMainPageViewController alloc] init];
    MLNavigationController *mineNav = [[MLNavigationController alloc] initWithNavigationBarClass:[FDDCustomNavigationBar class] toolbarClass:nil];
    mineNav.viewControllers = [NSArray arrayWithObjects:minePage,nil];
    
    RDVTabBarController *tabBarController = [[RDVTabBarController alloc] init];
    [tabBarController setViewControllers:@[mainNav,newsNav,searchNav,hotNav,mineNav]];
    
    [self customizeTabBarForController:tabBarController];

    return tabBarController;
}

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController {
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_bg"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_bg"];
    NSArray *tabBarItemImages = @[@"tabbar_home", @"tabbar_new", @"tabbar_search",@"tabbar_love",@"tabbar_mine"];
    NSArray *tabBarItemCheckedImages = @[@"tabbar_home_checked", @"tabbar_new_checked", @"tabbar_search_checked",@"tabbar_love_checked",@"tabbar_mine_checked"];
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[tabBarItemImages objectAtIndex:index]];
        UIImage *unselectedimage = [UIImage imageNamed:[tabBarItemCheckedImages objectAtIndex:index]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        index++;
    }
}

- (void)customizeInterface {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    
    UIImage *backgroundImage = nil;
    NSDictionary *textAttributes = nil;
    
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        backgroundImage = [UIImage imageNamed:@"navigationbar_background_tall"];
        
        textAttributes = @{
                           NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
                           NSForegroundColorAttributeName: [UIColor blackColor],
                           };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        backgroundImage = [UIImage imageNamed:@"navigationbar_background"];
        
        textAttributes = @{
                           UITextAttributeFont: [UIFont boldSystemFontOfSize:18],
                           UITextAttributeTextColor: [UIColor blackColor],
                           UITextAttributeTextShadowColor: [UIColor clearColor],
                           UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero],
                           };
#endif
    }
    
    [navigationBarAppearance setBackgroundImage:backgroundImage
                                  forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}

#pragma mark 初始化statusbar
- (void)initStatusBar
{
    //设置statusbar
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];//使得statusbar显示
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

@end
