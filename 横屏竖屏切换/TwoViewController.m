//
//  TwoViewController.m
//  横屏竖屏切换
//
//  Created by MENGCHEN on 15/10/23.
//  Copyright © 2015年 MENGCHEN. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()
@property (weak, nonatomic) UITextField * mytext;
/**   */
@property(nonatomic, weak)UIButton * btn;
@end

@implementation TwoViewController
-(UITextField *)mytext{
    if (!_mytext) {
        UITextField*text = [[UITextField alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
        [self.view addSubview:text];
        _mytext = text;
    }
    return _mytext;
}
-(UIButton *)btn{
    if (!_btn) {
        UIButton*button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(100, 200, 100, 100);
        [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btn = button];
    }
    return _btn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mytext.placeholder = @"name";
    self.btn.backgroundColor = [UIColor blackColor];
    self.view.backgroundColor = [UIColor greenColor];
    [self btnClick];
}

-(void)viewWillDisappear:(BOOL)animated{
    
    if ([[UIDevice currentDevice] orientation]!=UIDeviceOrientationPortrait) {
        [self btnClick];

    }
    
    [super viewWillDisappear:animated];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (void)btnClick{
    if([[UIDevice currentDevice] orientation]==UIDeviceOrientationPortrait){
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeLeft];
        
        self.navigationController.navigationBarHidden = YES;
        
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationLandscapeLeft| UIInterfaceOrientationPortrait;
//    return UIInterfaceOrientationLandscapeLeft;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskPortrait;
//    return UIInterfaceOrientationMaskLandscapeLeft;
}

-(BOOL)shouldAutorotate
{
    return NO;
}

@end
