//
//  BVLoginController.m
//  LibosExample
//
//  Created by 黑眸智能 on 2021/11/2.
//

#import "BVLoginController.h"

@interface BVLoginController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *appIdTF;
@property (weak, nonatomic) IBOutlet UITextField *appSecretTF;

@end

@implementation BVLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)clickLogin {
    [AppDelegate.getInstance enterApp];
}

@end
