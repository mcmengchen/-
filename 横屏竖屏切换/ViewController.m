//
//  ViewController.m
//  横屏竖屏切换
//
//  Created by MENGCHEN on 15/10/21.
//  Copyright © 2015年 MENGCHEN. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mytext;
@property (weak, nonatomic) IBOutlet UIButton *changeBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
}

- (IBAction)changeClick:(id)sender {
    
    /**
     *  设置刷新bar 的显示
     */
    [self setNeedsStatusBarAppearanceUpdate];

    //如果是正方向 ,那么就旋转
    if([[UIDevice currentDevice] orientation]==UIDeviceOrientationPortrait){
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeLeft];

        if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
        {
            [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationLandscapeRight] forKey:@"orientation"];
            
        }
        if([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0){
            if ([self.mytext isFirstResponder]) {
                [self.mytext resignFirstResponder];
            }
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                NSLog(@"进来啦");
                [self.mytext becomeFirstResponder];
            });    
        }


    }else{
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];

        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
            if([[[UIDevice currentDevice] systemVersion] floatValue])
            {
                [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationPortrait] forKey:@"orientation"];
            }
        }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
//    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    return UIInterfaceOrientationLandscapeLeft| UIInterfaceOrientationPortrait;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
//    return UIInterfaceOrientationMaskAllButUpsideDown;
    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskPortrait;

}

-(BOOL)shouldAutorotate
{
    return NO;
}

@end
