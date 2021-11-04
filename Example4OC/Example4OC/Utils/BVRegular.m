//
//  BVRegular.m
//  LibosExample
//
//  Created by 黑眸智能 on 2021/11/2.
//

#import "BVRegular.h"
#import <GZIP.h>

@implementation BVRegular

+(NSData *)loadData {
    NSURL *bundle = [[NSBundle mainBundle] URLForResource:@"map" withExtension:@"txt"];
    NSData *data = [NSData dataWithContentsOfURL:bundle];
    NSData *gData = [data gzippedData];
    return gData;
}

@end
