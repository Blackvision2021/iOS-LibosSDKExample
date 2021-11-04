//
//  BVShareMapController.m
//  LibosExample
//
//  Created by 黑眸智能 on 2021/11/2.
//

#import "BVShareMapController.h"

@interface BVShareMapController ()

@end

@implementation BVShareMapController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSString *)getNavTitle {
    return @"分享地图模式";
}

- (BVSweeperMapViewMode)getMapMode {
    return BVSweeperMapViewModeShareMode;
}

@end
