//
//  ViewController.m
//  6-DeviceRotation
//
//  Created by keso on 2017/5/21.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationChange:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)statusBarOrientationChange:(NSNotification *)notification{
    
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    if (orientation == UIInterfaceOrientationLandscapeRight) {
        
    }
    
    if (orientation ==UIInterfaceOrientationLandscapeLeft) {

    }
    
     if (orientation == UIInterfaceOrientationPortrait){
         
     }
    
    if (orientation == UIInterfaceOrientationPortraitUpsideDown){

    }
}

- (void)deviceOrientationChange:(NSNotification *)notification {
    
    UIDeviceOrientation  orient = [UIDevice currentDevice].orientation;
    
    switch (orient) {
        case UIDeviceOrientationPortrait:
            
            break;
        case UIDeviceOrientationLandscapeLeft:
            
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            
            break;
        case UIDeviceOrientationLandscapeRight:
            
            break;
            
        default:
            break;
    }
}


- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationLandscapeRight;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

@end
