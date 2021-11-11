//
//  BVRoomController.m
//  LibosExample
//
//  Created by 黑眸智能 on 2021/11/2.
//

#import "BVRoomController.h"

@interface BVRoomController ()<BVSweeperMapViewRoomEditDelegate>

@property(nonatomic, weak) UIButton *nameBtn;
@property(nonatomic, weak) UIButton *fengeBtn;
@property(nonatomic, weak) UIButton *hebingBtn;

@end

@implementation BVRoomController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSString *)getNavTitle {
    return @"房间编辑";
}

- (BVSweeperMapViewMode)getMapMode {
    return  BVSweeperMapViewModeRoomEditMode;
}

- (void)initView {
    [super initView];
    
    self.mapView.editRoomDelegate = self;
    
    UIButton *recoverBtn = [UIButton buttonWith:@"恢复选择"];
    [self.view addSubview:recoverBtn];
    [recoverBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.logView.mas_bottom).offset(10);
    }];
    [recoverBtn addTarget:self action:@selector(recover) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *nameBtn = [self createButton:@"重命名"];
    [self.view addSubview:nameBtn];
    [nameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(recoverBtn.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
    }];
    [nameBtn addTarget:self action:@selector(name) forControlEvents:UIControlEventTouchUpInside];
    self.nameBtn = nameBtn;
    
    UIButton *fengeBtn = [self createButton:@"分割"];
    [self.view addSubview:fengeBtn];
    [fengeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(recoverBtn.mas_bottom).offset(10);
        make.centerX.equalTo(self.view);
    }];
    [fengeBtn addTarget:self action:@selector(fenge) forControlEvents:UIControlEventTouchUpInside];
    self.fengeBtn = fengeBtn;
    
    UIButton *hebingBtn = [self createButton:@"合并"];
    [self.view addSubview:hebingBtn];
    [hebingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(recoverBtn.mas_bottom).offset(10);
        make.right.equalTo(self.view).offset(-10);
    }];
    [hebingBtn addTarget:self action:@selector(hebing) forControlEvents:UIControlEventTouchUpInside];
    self.hebingBtn = hebingBtn;
    
    UIButton *fengeOKBtn = [self createButton:@"获取分割点"];
    [self.view addSubview:fengeOKBtn];
    [fengeOKBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(hebingBtn.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
    }];
    [fengeOKBtn addTarget:self action:@selector(fengeOk) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *getRoomInfoBtn = [self createButton:@"获取房间属性"];
    [self.view addSubview:getRoomInfoBtn];
    [getRoomInfoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fengeOKBtn.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
    }];
    [getRoomInfoBtn addTarget:self action:@selector(getRoomInfo) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *adjustBtn = [self createButton:@"设置房间属性"];
    [self.view addSubview:adjustBtn];
    [adjustBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(getRoomInfoBtn);
        make.left.equalTo(getRoomInfoBtn.mas_right).offset(10);
    }];
    [adjustBtn addTarget:self action:@selector(tryAdjustRoom) forControlEvents:UIControlEventTouchUpInside];
    
    [self log:@"选择房间，再选择操作"];
    [self log:@"分割房间之后再点击<获取分割点>按钮"];
    
    [self recover];
}

-(UIButton *)createButton:(NSString *)title {
    UIButton *button = [UIButton buttonWith:title];
    [button setTitleColor:UIColor.systemGrayColor forState:UIControlStateDisabled];
    return button;
}

-(void)recover {
    [self.mapView resetRoomCheck];
    
    self.nameBtn.enabled = NO;
    self.fengeBtn.enabled = NO;
    self.hebingBtn.enabled = NO;
}

-(void)name {
    BVDrawMapRoom *room = [self.mapView getCheckRooms].firstObject;
    if(room != nil) {
        NSString *oldName = room.roomName;
        NSInteger no = room.no;
        
        [self log:[NSString stringWithFormat:@"将房间号： %ld 原名称：%@ 改名", no, oldName]];
    }
    
    [self recover];
}

-(void)fenge {
    if(![self.mapView canSliptRoom]) {
        [self log:@"房间数量到达上限"];
        [BVHUD showInfo:@"房间数量到达上限"];
        [self recover];
        return;
    }
    
    [self.mapView changeState:BVSweeperMapViewStateRoomSplitState];
    
    [self log:@"分割房间  可以在屏幕上分割)"];
}

-(void)fengeOk {
    NSNumber *roomId = [self.mapView getCheckRoomIds].firstObject;
    
    CGPoint p1 = [self.mapView getRoomSplitStartPoint];
    CGPoint p2 = [self.mapView getRoomSplitEndPoint];
    
    [self log:[NSString stringWithFormat:@"分割房间  房间号：%@  分割点 起点：%@  重点：%@", roomId.stringValue, NSStringFromCGPoint(p1), NSStringFromCGPoint(p2)]];
    
    [self recover];
}

-(void)hebing {
    NSArray<NSNumber *> *roomIds = [self.mapView getCheckRoomIds];
    
    [self log:[NSString stringWithFormat:@"合并房间  房间号：%@", roomIds]];
    
    [self recover];
}

-(void)getRoomInfo {
    NSArray<BVDrawMapRoom *> * rooms = [self.mapView getAllRoomInfo];
    NSMutableString *str = [NSMutableString string];
    [str appendString:@"当前房间属性：\n"];
    for (BVDrawMapRoom *item in rooms) {
        [str appendFormat:@"房间名称：%@ %@\n", item.roomName, item.roomProperty];
    }
    [self log:str];
}

-(void)tryAdjustRoom {
    NSInteger no = [self.mapView getCheckRoomIds].firstObject.integerValue;
    [self.mapView adjustRoomPropertyWith:no CleanTimes:nil FanLevel:[NSNumber numberWithInt:2] WaterLevel:nil];
    NSArray<BVDrawMapRoom *> * rooms = [self.mapView adjustRoomPropertyWith:no CleanTimes:[NSNumber numberWithInt:2] FanLevel:nil WaterLevel:nil];
    
    NSMutableString *str = [NSMutableString string];
    [str appendString:@"调整后的房间属性：\n"];
    for (BVDrawMapRoom *item in rooms) {
        [str appendFormat:@"房间名称：%@ %@\n", item.roomName, item.roomProperty];
    }
    [self log:str];
}

- (void)mapView:(BVSweeperMapView *)view didCheckRoomCount:(NSInteger)count {
    if(count == 0) {
        self.nameBtn.enabled = NO;
        self.fengeBtn.enabled = NO;
        self.hebingBtn.enabled = NO;
    } else if (count == 1) {
        self.nameBtn.enabled = YES;
        self.fengeBtn.enabled = YES;
        self.hebingBtn.enabled = NO;
    } else if (count == 2) {
        self.nameBtn.enabled = NO;
        self.fengeBtn.enabled = NO;
        self.hebingBtn.enabled = YES;
    }
}

@end
