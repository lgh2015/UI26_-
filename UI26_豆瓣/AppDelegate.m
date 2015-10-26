//
//  AppDelegate.m
//  UI26_豆瓣
//
//  Created by 李国灏 on 15/10/8.
//  Copyright © 2015年 李国灏. All rights reserved.
//

#import "AppDelegate.h"
#import "ActivityViewController.h"
#import "MovieViewController.h"
#import "CinemaViewController.h"
#import "MyViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //创建一个标签视图
    UITabBarController *tabBarController=[[UITabBarController alloc]init];
    //4个导航控制器
    ActivityViewController *activity=[[ActivityViewController alloc]init];
    UINavigationController *navi1=[[UINavigationController alloc]initWithRootViewController:activity];
    navi1.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"活动" image:[UIImage imageNamed:@"activity.png"] tag:100];
    
    MovieViewController *movie=[[MovieViewController alloc]init];
    UINavigationController *navi2=[[UINavigationController alloc]initWithRootViewController:movie];
    navi2.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"电影" image:[UIImage imageNamed:@"cinema.png"] tag:200];
    
    CinemaViewController  *cinema=[[CinemaViewController alloc]init];
    UINavigationController *navi3=[[UINavigationController alloc]initWithRootViewController:cinema];
    navi3.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"影院" image:[UIImage imageNamed:@"movie.png"] tag:300];

    MyViewController *mine=[[MyViewController alloc]init];
    UINavigationController *navi4=[[UINavigationController alloc]initWithRootViewController:mine];
    navi4.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"user.png"] tag:400];
    
    tabBarController.viewControllers=@[navi1,navi2 ,navi3,navi4];
    self.window.rootViewController=tabBarController;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
