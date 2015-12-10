//
//  AppDelegate.m
//  FoodShare
//
//  Created by David Tang on 11/15/15.
//  Copyright © 2015 David Tang. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "GuestViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    
    
    UIViewController *_defaultViewController = [ViewController new];
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    GuestViewController *_guestViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"guestViewController"];
    
    UINavigationController *_navController = [[UINavigationController alloc] initWithRootViewController:_guestViewController];
    
        UIImage *homeImage = [UIImage imageNamed:@"home.png"];
        UIButton *homeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        homeButton.bounds = CGRectMake(0, 0, 22, 22);
        [homeButton setImage:homeImage forState:UIControlStateNormal];
    
        UIView *notificationsContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        UIImage *notificationsImage = [UIImage imageNamed:@"bell.png"];
        UIButton *notificationsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        notificationsButton.bounds = CGRectMake(0, 0, 22, 22);
        [notificationsButton setImage:notificationsImage forState:UIControlStateNormal];
        [notificationsContainer addSubview:notificationsButton];
    
        UIImage *settingsImage = [UIImage imageNamed:@"settings.png"];
        UIButton *settingsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        settingsButton.bounds = CGRectMake(0, 0, 22, 22);
        [settingsButton setImage:settingsImage forState:UIControlStateNormal];
    
        UIBarButtonItem *home = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
        UIBarButtonItem *settings = [[UIBarButtonItem alloc] initWithCustomView:settingsButton];
        _navController.navigationItem.leftBarButtonItem = home;
        _navController.navigationItem.rightBarButtonItem = settings;
        _navController.navigationItem.titleView = notificationsContainer;
    
    _window.rootViewController = _navController;
    [_window makeKeyAndVisible];
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
