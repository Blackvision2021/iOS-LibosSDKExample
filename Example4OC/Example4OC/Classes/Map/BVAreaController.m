//
//  BVAreaController.m
//  LibosExample
//
//  Created by 黑眸智能 on 2021/11/2.
//

#import "BVAreaController.h"

@interface BVAreaController ()

@end

@implementation BVAreaController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSString *)getNavTitle {
    return @"划区";
}

- (void)initView {
    [super initView];
    
    [self.mapView changeState:BVSweeperMapViewStatePlanningZoneEditState];
    
    UIButton *addZoneBtn = [UIButton buttonWith:@"添加划区"];
    [self.view addSubview:addZoneBtn];
    [addZoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.logView.mas_bottom).offset(10);
        make.right.equalTo(self.view).offset(-40);
    }];
    [addZoneBtn addTarget:self action:@selector(addZone) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *getDataBtn = [UIButton buttonWith:@"获取数据"];
    [self.view addSubview:getDataBtn];
    [getDataBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(addZoneBtn.mas_bottom).offset(10);
        make.right.equalTo(self.view).offset(-40);
    }];
    [getDataBtn addTarget:self action:@selector(getData) forControlEvents:UIControlEventTouchUpInside];
}

-(void)addZone {
    if (![self.mapView addPlanningZone]) {
        [self log:@"划区到达上限"];
        [BVHUD showInfo:@"划区到达上限"];
    }
}

-(void)getData {
    NSArray *zone = [self.mapView getPlanningZone];
    [self log:[NSString stringWithFormat:@"划区: %@", zone]];
}

@end
