//
//  AppDelegate.m
//  CollectionViewAndMore
//
//  Created by Mahbub Ahmed on 4/4/17.
//  Copyright © 2017 Mahbub Ahmed. All rights reserved.
//

#import "AppDelegate.h"
#import "MAMovieViewController.h"
#import "MAFavoriteViewController.h"
#import "MASeasonViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //Setting root view controller & tab bar controller
    self.window.rootViewController = [self setTabBarController];;
    [self.window makeKeyAndVisible];
    
    //Setting navigation tint color
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    
    return YES;
}

-(UITabBarController *) setTabBarController
{
    //Initilizing view controller with nib
    MAMovieViewController *movieViewController=[[MAMovieViewController alloc]initWithNibName:@"MAMovieViewController" bundle:[NSBundle mainBundle]];
    MASeasonViewController *seasonViewController=[[MASeasonViewController alloc]initWithNibName:@"MASeasonViewController" bundle:[NSBundle mainBundle]];
    MAFavoriteViewController *favoriteViewController=[[MAFavoriteViewController alloc]initWithNibName:@"MAFavoriteViewController" bundle:[NSBundle mainBundle]];
    
    
    //Initlizing navigation controller with view controller
    UINavigationController *movieNavController=[[UINavigationController alloc]initWithRootViewController:movieViewController];
    UINavigationController *seasonNavController=[[UINavigationController alloc]initWithRootViewController:seasonViewController];
    UINavigationController *favroiteNavController=[[UINavigationController alloc]initWithRootViewController:favoriteViewController];
    
    //IOS 7.0 and later by default navigation bar & tab bar  translucent is set to true
    //setting navigation controller translucent to false
    movieNavController.navigationBar.translucent = NO;
    seasonNavController.navigationBar.translucent = NO;
    favroiteNavController.navigationBar.translucent = NO;
    
    //Array of view controller's
    NSArray* controllersWithNav = [NSArray arrayWithObjects:movieNavController, seasonNavController, favroiteNavController, nil];
    
    //Initilizing tab bar controller
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    //Adding view's to tab bar controller
    tabBarController.viewControllers = controllersWithNav;
    
    //Setting tab bar icons/image
    tabBarController.tabBar.items[0].image=[UIImage imageNamed:@"home"];
    tabBarController.tabBar.items[1].image=[UIImage imageNamed:@"season"];
    tabBarController.tabBar.items[2].image=[UIImage imageNamed:@"favorite"];
    
    //To set tab bar translucent to false 
    //tabBarController.tabBar.translucent=NO;
    

    //Changing the tab bar selectioin color
    [[UITabBar appearance] setTintColor:[UIColor blackColor]];
    
    //Setting tab bar title
    tabBarController.tabBar.items[0].title=@"Movie";
    tabBarController.tabBar.items[1].title=@"Season";
    tabBarController.tabBar.items[2].title=@"Favorite";
    
    return tabBarController;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
