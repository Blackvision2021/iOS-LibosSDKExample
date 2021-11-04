//
//  UIButton+UIButton.m
//  LibosExample
//
//  Created by 黑眸智能 on 2021/11/2.
//

#import "UIButton+UIButton.h"

@implementation UIButton (UIButton)

+(UIButton *)buttonWith:(NSString *)title {
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];
    return button;
}

@end
