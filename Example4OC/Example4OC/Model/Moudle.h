//
//  Moudle.h
//  LibosExample
//
//  Created by 黑眸智能 on 2021/11/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Moudle : NSObject

@property(nonatomic, copy) NSString *group;

@property(nonatomic, strong) NSMutableArray<NSString *> *list;

- (instancetype)initWith:(NSString *)group;

@end

NS_ASSUME_NONNULL_END
