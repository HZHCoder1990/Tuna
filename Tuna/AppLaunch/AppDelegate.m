//
//  AppDelegate.m
//  Tuna
//
//  Created by mac on 2024/7/12.
//

#import "AppDelegate.h"
#import "OWSMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[OWSMainViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}
@end
