//
//  BVHUD.m
//  LibosExample
//
//  Created by 黑眸智能 on 2021/11/2.
//

#import "BVHUD.h"
#import <SVProgressHUD.h>

@implementation BVHUD

+(void)showInfo:(NSString *)info{
    [SVProgressHUD showInfoWithStatus:info];
}

+(void)showLoading:(NSString *)info {
    [SVProgressHUD showWithStatus:info];
}

+(void)dismiss {
    [SVProgressHUD dismiss];
}

@end
