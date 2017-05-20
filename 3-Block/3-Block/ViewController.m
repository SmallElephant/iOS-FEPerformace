//
//  ViewController.m
//  3-Block
//
//  Created by keso on 2017/5/20.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "ViewController.h"

typedef void (^dBlock)();

dBlock exampleD_getBlock() {
    char d = 'D';
    return ^{
        printf("%cn", d);
    };
}

void exampleD() {
    exampleD_getBlock()();
}

typedef int (^SumBlock)(int a,int b);

@interface ViewController ()

@property (assign, nonatomic) SumBlock stackBlock;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUp];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SetUp

- (void)setUp {

    
    void (^globalBlock)() = ^() {
        NSLog(@"FlyElephant---全局Block");
    };
    
    NSLog(@"FlyElephant---%@",globalBlock);
    
    __weak typeof(self) weakSelf = self;
    self.stackBlock = ^int(int a, int b) {
        NSLog(@"FlyElephant---%@",weakSelf.stackBlock);
        return a + b;
    };
    
    NSInteger test = self.stackBlock(10,10);
    NSLog(@"FlyElephant---%ld---%@",test,self.stackBlock);
    
    NSInteger num = 27;
    
    void (^mallocBlock)() = ^() {
        NSLog(@"FlyElephant---栈Block--%ld",num);
    };
    NSLog(@"FlyElephant---%@",mallocBlock);
}


@end
