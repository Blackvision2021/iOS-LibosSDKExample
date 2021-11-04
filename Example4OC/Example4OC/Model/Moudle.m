//
//  Moudle.m
//  LibosExample
//
//  Created by 黑眸智能 on 2021/11/2.
//

#import "Moudle.h"

@implementation Moudle

- (instancetype)initWith:(NSString *)group {
    if(self = [super init]) {
        self.group = group;
        self.list = [NSMutableArray array];
    }
    return self;
}

@end
