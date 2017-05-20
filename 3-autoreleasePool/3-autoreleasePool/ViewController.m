//
//  ViewController.m
//  3-autoreleasePool
//
//  Created by FlyElephant on 2017/5/19.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end



@implementation ViewController


__weak id reference = nil;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    @autoreleasepool {
        NSArray *arr = [NSArray arrayWithObjects:@"FlyElephant",@"Keso", nil];
        reference = arr;
    }

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"数组:%@",reference);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
     NSLog(@"数组:%@",reference);
}

//__weak id reference = nil;
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    NSString *str = [NSString stringWithFormat:@"sunnyxx"];
//    // str是一个autorelease对象，设置一个weak的引用来观察它
//    reference = str;
//}
//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    NSLog(@"%@", reference); // Console: sunnyxx
//}
//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    NSLog(@"%@", reference); // Console: (null)
//}

//__weak id objTrace;
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    NSArray *localArr = [NSArray arrayWithObject:@"Weng Zilin"];//这是一个局部对象，封装了autorelease方法
//    objTrace = localArr;
//    
//
//}
//
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    NSLog(@"viewWillAppear__localArr:%@", objTrace);
//}
//
//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    NSLog(@"viewWillAppear__localArr:%@", objTrace);
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

- (IBAction)testAction:(UIButton *)sender {
//    NSLog(@"输出的结果:%@",objTrace);
}

@end
