//
//  ViewController.m
//  LibosExample
//
//  Created by 黑眸智能 on 2021/11/2.
//

#import "ViewController.h"
#import <BVSweeperKit/BVSweeperKit-Swift.h>
#import "Moudle.h"

#import "BVMapController.h"
#import "BVForbiddenController.h"
#import "BVAreaController.h"
#import "BVRoomController.h"
#import "BVShareMapController.h"
#import "BVPreViewMapController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong) NSMutableArray<Moudle *> *data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
}

- (void)initData {
    self.data = [NSMutableArray array];
    
    Moudle *wifi = [[Moudle alloc] initWith:@"配网"];
    [wifi.list addObject:@"Ap配网"];
    [wifi.list addObject:@"蓝牙配网"];
    [wifi.list addObject:@"4G配网"];
    [wifi.list addObject:@"扫码配网"];
    
    Moudle *device = [[Moudle alloc] initWith:@"设备"];
    [device.list addObject:@"设备列表"];
    
    Moudle *map = [[Moudle alloc] initWith:@"地图控件"];
    [map.list addObject:@"地图显示"];
    [map.list addObject:@"禁区、虚拟墙"];
    [map.list addObject:@"划区"];
    [map.list addObject:@"房间编辑"];
    [map.list addObject:@"分享地图模式"];
    [map.list addObject:@"预览地图模式"];
    
    [self.data addObject:wifi];
    [self.data addObject:device];
    [self.data addObject:map];
    
    // 初始化地图样式
    [BVSweeperMapConfig shared].robotIcon = [UIImage imageNamed:@"icon_扫地机"];
    [BVSweeperMapConfig shared].chargingIcon = [UIImage imageNamed:@"iocn_充电座"];
    [BVSweeperMapConfig shared].deleteIcon = [UIImage imageNamed:@"icon_删除"];
    [BVSweeperMapConfig shared].adjustIcon = [UIImage imageNamed:@"icon_调整大小"];
}

- (void)initView {
    self.navigationItem.title = @"libos-sdk";
    self.view.backgroundColor = UIColor.blackColor;
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleInsetGrouped];
    [tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"UITableViewCell"];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = 60;
    [self.view addSubview:tableView];
}

//UITableViewDataSource,UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.data[section].list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (@available(iOS 14.0, *)) {
        UIListContentConfiguration *content = cell.defaultContentConfiguration;
        content.text = self.data[indexPath.section].list[indexPath.row];
        cell.contentConfiguration = content;
    } else {
        cell.textLabel.text = self.data[indexPath.section].list[indexPath.row];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 38;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return  self.data[section].group;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = nil;
    if(indexPath.section == 0) {
        
    } else if(indexPath.section == 1) {
        
    } else if(indexPath.section == 2) {
        switch (indexPath.row) {
            case 0:
                vc = [[BVMapController alloc]init];
                break;
            case 1:
                vc = [[BVForbiddenController alloc]init];
                break;
            case 2:
                vc = [[BVAreaController alloc]init];
                break;
            case 3:
                vc = [[BVRoomController alloc]init];
                break;
            case 4:
                vc = [[BVShareMapController alloc]init];
                break;
            case 5:
                vc = [[BVPreViewMapController alloc]init];
                break;
            default:
                break;
        }
    }
    
    if(vc) {
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
