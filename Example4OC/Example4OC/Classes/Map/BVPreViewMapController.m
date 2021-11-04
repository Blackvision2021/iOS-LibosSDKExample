//
//  BVPreViewMapController.m
//  LibosExample
//
//  Created by 黑眸智能 on 2021/11/2.
//

#import "BVPreViewMapController.h"

@interface BVPreViewMapController ()

@end

@implementation BVPreViewMapController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSString *)getNavTitle {
    return @"预览地图模式";
}

- (BVSweeperMapViewMode)getMapMode {
    return BVSweeperMapViewModeMapPreviewMode;
}

@end
