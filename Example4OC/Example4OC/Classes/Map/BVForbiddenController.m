//
//  BVForbiddenController.m
//  LibosExample
//
//  Created by 黑眸智能 on 2021/11/2.
//

#import "BVForbiddenController.h"

@interface BVForbiddenController ()

@end

@implementation BVForbiddenController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSString *)getNavTitle {
    return @"禁区、虚拟墙";
}

- (void)initView {
    [super initView];
    
    [self.mapView changeState: BVSweeperMapViewStateRestricteEditState];
    
    UIButton *addWallBtn = [UIButton buttonWith:@"添加虚拟墙"];
    [self.view addSubview:addWallBtn];
    [addWallBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.logView.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(40);
    }];
    [addWallBtn addTarget:self action:@selector(addWall) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *addZoneBtn = [UIButton buttonWith:@"添加禁区"];
    [self.view addSubview:addZoneBtn];
    [addZoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.logView.mas_bottom).offset(10);
        make.right.equalTo(self.view).offset(-40);
    }];
    [addZoneBtn addTarget:self action:@selector(addZone) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *resetBtn = [UIButton buttonWith:@"恢复原始数据"];
    [self.view addSubview:resetBtn];
    [resetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(addWallBtn.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(40);
    }];
    [resetBtn addTarget:self action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *getDataBtn = [UIButton buttonWith:@"获取数据"];
    [self.view addSubview:getDataBtn];
    [getDataBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(addWallBtn.mas_bottom).offset(10);
        make.right.equalTo(self.view).offset(-40);
    }];
    [getDataBtn addTarget:self action:@selector(getData) forControlEvents:UIControlEventTouchUpInside];
}

-(void)addWall {
    if (![self.mapView addVirtualWall]) {
        [self log:@"虚拟墙到达上限"];
        [BVHUD showInfo:@"虚拟墙到达上限"];
    }
}

-(void)addZone {
    if (![self.mapView addForbiddenZone]) {
        [self log:@"禁区到达上限"];
        [BVHUD showInfo:@"禁区到达上限"];
    }
}

-(void)reset {
    [self log:@"恢复数据"];
    [self.mapView resetRestrictedToOriginal];
}

-(void)getData {
    if (![self.mapView canSendVirtualWallAndForbiddenZone]) {
        [self log:@"有虚拟墙或者禁区设置在了设备或扫地机附近"];
        return;
    }
    
    NSArray *wall = [self.mapView getVirtualWall];
    NSArray *zone = [self.mapView getForbiddenZone];
    
    [self log:[NSString stringWithFormat:@"虚拟墙： %@ \n禁区： %@",wall, zone]];
}

@end
