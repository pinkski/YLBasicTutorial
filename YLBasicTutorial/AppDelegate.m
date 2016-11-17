//
//  AppDelegate.m
//  YLBasicTutorial
//
//  Created by xuanlin.zhu on 16/1/29.
//  Copyright © 2016年 xuanlin.zhu. All rights reserved.
//

#import "AppDelegate.h"

// APP有五种运行状态机：not-running(未运行) inactive(前台运行，不响应事件，如打电话) active(前台运行) background(后台运行，代码继续执行) suspended(后台运行，代码停止执行)

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

    // from active to inactive
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    // background
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    // foreground
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    // from inactive to active
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
    // suspended
}

@end
