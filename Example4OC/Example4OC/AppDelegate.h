//
//  AppDelegate.h
//  Example4OC
//
//  Created by 黑眸智能 on 2021/11/4.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow * window;

+(AppDelegate *)getInstance;

-(void)enterApp;

@end

