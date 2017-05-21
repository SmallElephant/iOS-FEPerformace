//
//  GCDViewController.m
//  4-MultiThread
//
//  Created by keso on 2017/5/20.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@property (strong, nonatomic) NSMutableArray *data;

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUp];
   // [self setUpQueue];
   // [self setTargetQueue];
//    [self setBarrierQueue];
//    [self setApplyQueue];
//    [self setGroupQueue];
//    [self setGroupQueue2];
//    [self setGroupQueue3];
//    [self setGroupQueue4];
    [self setSemaphore];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)showAction:(UIButton *)sender {
    NSLog(@"测试数据---%@",self.data);
}

- (void)setUp {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        for (NSInteger i=0; i < 20; i++) {
         //   NSLog(@"FlyLElephant---异步：%ld",i);
        }
    });
    
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
       // NSLog(@"同步数据");
    });
    

    
    dispatch_queue_t serialQueue = dispatch_queue_create("com.flyelephant.wwww", DISPATCH_QUEUE_SERIAL);
    
   

}

- (void)setUpQueue {
    
    dispatch_queue_t serialQueue = dispatch_queue_create("com.flyelephant.wwww", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(serialQueue, ^{
        NSLog(@"Serial--1");
    });
    
    dispatch_async(serialQueue, ^{
        NSLog(@"Serial--2");
    });
    
    dispatch_async(serialQueue, ^{
        NSLog(@"Serial--3");
    });
    
    dispatch_async(serialQueue, ^{
        NSLog(@"Serial--4");
    });
    
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.flyelephant.www", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(concurrentQueue, ^{
        NSLog(@"Concurrent--1");
    });
    
    dispatch_async(concurrentQueue, ^{
        NSLog(@"Concurrent--2");
    });
    
    dispatch_async(concurrentQueue, ^{
        NSLog(@"Concurrent--3");
    });
    
    dispatch_async(concurrentQueue, ^{
        NSLog(@"Concurrent--4");
    });
    
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,0);
 
}

- (void)setTargetQueue {
    dispatch_queue_t targetQueue = dispatch_queue_create("targetQueue", DISPATCH_QUEUE_SERIAL);//目标队列
    dispatch_queue_t serialQueue = dispatch_queue_create("queue1", DISPATCH_QUEUE_SERIAL);//串行队列
    dispatch_queue_t conQueue = dispatch_queue_create("queue1", DISPATCH_QUEUE_CONCURRENT);//并发队列

    dispatch_set_target_queue(serialQueue, targetQueue);
    dispatch_set_target_queue(conQueue, targetQueue);
    
    dispatch_async(serialQueue, ^{
        NSLog(@"FlyElephant---任务1 开始");
        [NSThread sleepForTimeInterval:3.f];
        NSLog(@"FlyElephant---任务1 结束");
    });
    
    dispatch_async(conQueue, ^{
        NSLog(@"FlyElephant---任务2 开始");
        [NSThread sleepForTimeInterval:2.f];
        NSLog(@"FlyElephant---任务2 结束");
    });
    
    dispatch_async(conQueue, ^{
        NSLog(@"FlyElephant---任务3 开始");
        [NSThread sleepForTimeInterval:1.f];
        NSLog(@"FlyElephant---任务3 结束");
    });

}

- (void)setQueueAfter {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"延迟执行");
    });
}

- (void)setBarrierQueue {
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.barrier.queue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"FlyElephant-1");
    });
    
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"FlyElephant-2");
    });
    
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"FlyElephant-3");
    });
    
    dispatch_barrier_async(concurrentQueue, ^(){
        NSLog(@"FlyElephant---dispatch_barrier_async");
    });
    
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"FlyElephant-4");
    });
    
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"FlyElephant-5");
    });
    
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"FlyElephant-6");
    });
}

- (void)setApplyQueue {
    dispatch_queue_t queue = dispatch_queue_create("com.flyelephant.www", DISPATCH_QUEUE_CONCURRENT);
    dispatch_apply(10, queue, ^(size_t i) {
        NSLog(@"并行执行---%ld",i);
    });
    NSLog(@"FlyElephant---执行完成");
    
    
    dispatch_queue_t serialQueue = dispatch_queue_create("com.flyelephant.www", DISPATCH_QUEUE_SERIAL);
    dispatch_apply(10, serialQueue, ^(size_t i) {
        NSLog(@"串行执行---%ld",i);
    });
    NSLog(@"FlyElephant---执行完成");
}

- (void)setGroupQueue {
    

    
    dispatch_queue_t dispatchQueue =  dispatch_queue_create("com.group.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t dispatchGroup = dispatch_group_create();
    
    dispatch_group_async(dispatchGroup, dispatchQueue, ^{
        NSLog(@"FlyElephant---任务1完成");
    });
    
    dispatch_group_async(dispatchGroup, dispatchQueue, ^{
        sleep(3);
        NSLog(@"FlyElephant---任务2完成");
    });
    
    dispatch_group_notify(dispatchGroup, dispatchQueue, ^{
        NSLog(@"dispatch_group_notify 执行");
    });
    
    dispatch_group_async(dispatchGroup, dispatchQueue, ^{
        dispatch_group_wait(dispatchGroup, dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC));
        NSLog(@"dispatch_group_wait 结束");
    });
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        dispatch_group_wait(disgroup, dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC));
//        NSLog(@"dispatch_group_wait 结束");
//    });
}

- (void)setGroupQueue2 {
    
    dispatch_queue_t dispatchQueue =  dispatch_queue_create("com.group.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t dispatchGroup = dispatch_group_create();
    
    dispatch_group_async(dispatchGroup, dispatchQueue, ^{
        NSLog(@"FlyElephant---任务1完成");
    });
    
    dispatch_group_async(dispatchGroup, dispatchQueue, ^{
        sleep(3);
        NSLog(@"FlyElephant---任务2完成");
    });
    
    dispatch_group_async(dispatchGroup, dispatchQueue, ^{
        NSLog(@"FlyElephant---任务3完成");
    });
    
    dispatch_group_wait(dispatchGroup, DISPATCH_TIME_FOREVER);
    NSLog(@"dispatch_group_wait 结束");


    dispatch_group_async(dispatchGroup, dispatchQueue, ^{;
        NSLog(@"FlyElephant---任务4完成");
    });
    
    dispatch_group_async(dispatchGroup, dispatchQueue, ^{
        NSLog(@"FlyElephant---任务5完成");
    });

}

- (void)setGroupQueue3 {
    
    dispatch_queue_t dispatchQueue =  dispatch_queue_create("com.group.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t dispatchGroup = dispatch_group_create();
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    
    dispatch_group_enter(dispatchGroup);
    
    dispatch_group_async(dispatchGroup, dispatchQueue, ^(){
        dispatch_async(globalQueue, ^{
            sleep(2);
            NSLog(@"FlyElephant---任务1完成");
            dispatch_group_leave(dispatchGroup);
        });
    });
    
    dispatch_group_enter(dispatchGroup);
    
    dispatch_group_async(dispatchGroup, dispatchQueue, ^(){
        dispatch_async(globalQueue, ^{
            sleep(1);
            NSLog(@"FlyElephant---任务2完成");
            dispatch_group_leave(dispatchGroup);
        });
    });
    
    dispatch_group_enter(dispatchGroup);
    
    dispatch_group_async(dispatchGroup, dispatchQueue, ^(){
        dispatch_async(globalQueue, ^{
            NSLog(@"FlyElephant---任务3完成");
            dispatch_group_leave(dispatchGroup);
        });
    });
    
    dispatch_group_notify(dispatchGroup, dispatchQueue, ^{
        NSLog(@"FlyElephant---dispatch_group_notify任务完成");
    });
    
}

- (void)setGroupQueue4 {
    
    dispatch_queue_t dispatchQueue = dispatch_queue_create("com.group.www", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    dispatch_group_t dispatchGroup = dispatch_group_create();
    
    dispatch_group_async(dispatchGroup, dispatchQueue, ^(){
        dispatch_async(globalQueue, ^{
            sleep(2);
            NSLog(@"FlyElephant---任务1完成");
        });
    });
    
    dispatch_group_async(dispatchGroup, dispatchQueue, ^(){
        dispatch_async(globalQueue, ^{
            sleep(3);
            NSLog(@"FlyElephant---任务2完成");
        });
    });
    
    dispatch_group_notify(dispatchGroup, dispatch_get_main_queue(), ^(){
       NSLog(@"FlyElephant---dispatch_group_notify");
    });
}

- (void)setSemaphore {
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    
    self.data  = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < 10; i++) {
        
        dispatch_async(queue, ^(){
            
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            
            [self.data addObject:[NSString stringWithFormat:@"FlyElephant---%ld",i]];
            
            dispatch_semaphore_signal(semaphore);
            
        });
    }
}


@end
