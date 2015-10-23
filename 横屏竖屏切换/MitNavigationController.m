//
//  MitNavigationController.m
//  横屏竖屏切换
//
//  Created by MENGCHEN on 15/10/21.
//  Copyright © 2015年 MENGCHEN. All rights reserved.
//

#import "MitNavigationController.h"

@interface MitNavigationController ()

@end

@implementation MitNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate NS_AVAILABLE_IOS(6_0) {
    
    return [self.topViewController shouldAutorotate];
}
-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return [self.topViewController supportedInterfaceOrientations];
}
// Returns interface orientation masks.
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation NS_AVAILABLE_IOS(6_0) {
    
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}
//-(NSUInteger)supportedInterfaceOrientations
//{
//    return UIInterfaceOrientationMaskPortrait;
//}


 
 

@end
