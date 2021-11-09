//
//  AppDelegate.m
//  LibosExample
//
//  Created by 黑眸智能 on 2021/11/2.
//

#import "AppDelegate.h"
#import "BVLoginController.h"
#import <IQKeyboardManager.h>
#import "ViewController.h"
#import <BVCommon/BVCommon-Swift.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [self initSDK];
    
    [self enterLogin];
    
    [_window makeKeyAndVisible];
    
    return YES;
}

///获取当前实例
+(AppDelegate *)getInstance{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

-(void)initSDK {
    IQKeyboardManager.sharedManager.enable = YES;
    IQKeyboardManager.sharedManager.shouldResignOnTouchOutside = YES;
    
    [BVClient setDebugMode:YES];
}

-(void)enterLogin {
    _window.rootViewController = [[BVLoginController alloc]init];
}

-(void)enterApp {
    _window.rootViewController = [[UINavigationController alloc]initWithRootViewController:[[ViewController alloc] init]];
}

@end
