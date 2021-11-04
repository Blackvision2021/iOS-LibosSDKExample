//
//  BVMapController.h
//  LibosExample
//
//  Created by 黑眸智能 on 2021/11/2.
//

#import <UIKit/UIKit.h>
#import <BVSweeperKit/BVSweeperKit-Swift.h>

NS_ASSUME_NONNULL_BEGIN

@interface BVMapController : UIViewController

@property(nonatomic, weak) BVSweeperMapView *mapView;
@property(nonatomic, weak) UITextView *logView;

-(NSString *)getNavTitle;

-(BVSweeperMapViewMode)getMapMode;

-(void)initView;

-(void)log:(NSString *)msg;

@end

NS_ASSUME_NONNULL_END
