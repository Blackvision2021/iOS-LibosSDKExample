//
//  BVHUD.h
//  LibosExample
//
//  Created by 黑眸智能 on 2021/11/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BVHUD : NSObject

+(void)showInfo:(NSString *)info;

+(void)showLoading:(NSString *)info;

+(void)dismiss;

@end

NS_ASSUME_NONNULL_END
