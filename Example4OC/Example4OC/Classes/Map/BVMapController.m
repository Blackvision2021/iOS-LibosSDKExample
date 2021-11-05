//
//  BVMapController.m
//  LibosExample
//
//  Created by 黑眸智能 on 2021/11/2.
//

#import "BVMapController.h"
#import "BVRegular.h"

@interface BVMapController ()



@end

@implementation BVMapController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)dealloc {
    NSLog(@"销毁");
}

-(NSString *)getNavTitle {
    return @"地图显示";
}

-(BVSweeperMapViewMode)getMapMode {
    return BVSweeperMapViewModeNormalMode;
}

-(void)initView {
    self.navigationItem.title = [self getNavTitle];
    self.view.backgroundColor = UIColor.systemBackgroundColor;
    
    UIView *emptyView = [[UIView alloc]init];
    emptyView.backgroundColor = UIColor.redColor;
    
    BVSweeperMapViewMode mode = [self getMapMode];
    
    CGFloat height = [AppDelegate getInstance].window.windowScene.statusBarManager.statusBarFrame.size.height;
    
    BVSweeperMapView *mapView = [[BVSweeperMapView alloc]initWithMode:mode emptyView:emptyView];
    mapView.backgroundColor = UIColor.grayColor;
    [self.view addSubview:mapView];
    [mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(height);
        make.height.mas_equalTo(500);
    }];
    
    UITextView *logView = [[UITextView alloc]init];
    [self.view addSubview:logView];
    [logView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(mapView.mas_bottom);
        make.height.mas_equalTo(150);
    }];
    
    NSData *data = [BVRegular loadData];
    BVSweeperMapData *model = [BVSweeperMapData modelWithData:data];
    [mapView reciveMapData:model];
    
    self.mapView = mapView;
    self.logView = logView;
}

-(void)log:(NSString *)msg {
    NSString *text = [NSString stringWithFormat:@"%@\n%@",self.logView.text,msg];
    self.logView.text = text;
}

@end
