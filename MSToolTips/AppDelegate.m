//
//  AppDelegate.m
//  MSToolTips
//
//  Created by Marian Paul on 12/09/12.
//  Copyright (c) 2012 Marian Paul. All rights reserved.
//

#import "AppDelegate.h"
#import "YouTubeViewController.h"
#import "LocalFileViewController.h"
#import "WineViewController.h"
#import "PerformancesViewController.h"
#import "DebuggerViewController.h"
#import "SampleLoadViewController.h"

@implementation AppDelegate
@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.tabBarController = [[UITabBarController alloc] init];
    
    YouTubeViewController *youtubeVC = [[YouTubeViewController alloc] initWithNibName:@"YouTubeViewController" bundle:nil];
    UITabBarItem *tabBarItem1 = [[UITabBarItem alloc] initWithTitle:@"Youtube"
                                                             image:nil
                                                               tag:0];
    youtubeVC.tabBarItem = tabBarItem1;
    
    LocalFileViewController *localVC = [[LocalFileViewController alloc] initWithNibName:@"LocalFileViewController" bundle:nil];
    UITabBarItem *tabBarItem2 = [[UITabBarItem alloc] initWithTitle:@"Local"
                                                              image:nil
                                                                tag:1];
    localVC.tabBarItem = tabBarItem2;
    [self.tabBarController setViewControllers:[NSArray arrayWithObjects:youtubeVC, localVC, nil]];
    [self.window setRootViewController:self.tabBarController];
    
    WineViewController *wineVC = [[WineViewController alloc] init];
    UITabBarItem *tabBarItem3 = [[UITabBarItem alloc] initWithTitle:@"Wine"
                                                              image:nil
                                                                tag:2];
    wineVC.tabBarItem = tabBarItem3;
    
    PerformancesViewController *perf = [[PerformancesViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *navControllerPerf = [[UINavigationController alloc] initWithRootViewController:perf];
    UITabBarItem *tabBarItem4 = [[UITabBarItem alloc] initWithTitle:@"Perf"
                                                              image:nil
                                                                tag:3];
    navControllerPerf.tabBarItem = tabBarItem4;
    
    DebuggerViewController *debug = [[DebuggerViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *navControllerDebug = [[UINavigationController alloc] initWithRootViewController:debug];
    UITabBarItem *tabBarItem5 = [[UITabBarItem alloc] initWithTitle:@"Debug"
                                                              image:nil
                                                                tag:4];
    navControllerDebug.tabBarItem = tabBarItem5;
    
    SampleLoadViewController *sample = [[SampleLoadViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *navControllerSample = [[UINavigationController alloc] initWithRootViewController:sample];
    UITabBarItem *tabBarItem6 = [[UITabBarItem alloc] initWithTitle:@"Sample"
                                                              image:nil
                                                                tag:5];
    navControllerSample.tabBarItem = tabBarItem6;
    
    [self.tabBarController setViewControllers:[NSArray arrayWithObjects:youtubeVC, localVC, wineVC, navControllerPerf, navControllerDebug, navControllerSample, nil]];
    [self.window setRootViewController:self.tabBarController];
    
    [self.window makeKeyAndVisible];
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

@end
