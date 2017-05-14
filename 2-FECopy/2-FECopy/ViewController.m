//
//  ViewController.m
//  2-FECopy
//
//  Created by keso on 2017/5/14.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "ViewController.h"
#import "Course.h"

@interface ViewController ()

@property (copy, nonatomic) NSString *name;

@property (strong, nonatomic) NSString *infoDetail;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self copyTest];
    [self mutaleCopyTest];
    [self test];
    [self test2];
    [self propertyCopy];
    [self classCopy];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)copyTest {
    NSString *string = @"FlyElephant";
    NSString *copyString = [string copy];
    NSMutableString *mutableCopyString = [string mutableCopy];
    [mutableCopyString appendString:@"test"];
    NSLog(@"NSString原始指针:%p copy之后的指针 = %p mutableCopy之后的指针 = %p", string, copyString, mutableCopyString);
}

- (void)mutaleCopyTest {
    NSMutableString *string = [[NSMutableString alloc] initWithString:@"FlyELephant"];
    NSMutableString *copyString = [string copy];
    NSMutableString *mutableCopyString = [string mutableCopy];
    
    NSLog(@"NSMutableString原始指针:%p copy之后的指针 = %p mutableCopy之后的指针 = %p", string, copyString, mutableCopyString);
    
    [mutableCopyString appendString:@"test"];
    
    NSLog(@"原始字符串:%@---copy之后的字符串:%@---mutalbeCopy之后的字符串:%@",string,copyString,mutableCopyString);
}

- (void)test {
    
    NSMutableString *str1 = [NSMutableString stringWithString:@"FlyElephant"];
    NSMutableString *str2 = [NSMutableString stringWithString:@"Keso"];

    NSMutableString *str3 = [NSMutableString stringWithString:@"Objective-C"];
    NSMutableString *str4 = [NSMutableString stringWithString:@"Swift"];

    NSLog(@"str1:%p  str2:%p str3:%p str4:%p", str1,str2,str3,str4);
    NSMutableArray *dataArray = [NSMutableArray arrayWithObjects:
                                 str1,
                                 str2,
                                 str3,
                                 str4,
                                 nil
                                 ];
    
    NSMutableArray *dataArray2 = [dataArray mutableCopy];
    NSMutableString *mStr;
    
    mStr = dataArray[0];
    [mStr appendString:@"--append"];
    NSLog(@"dataArray：%@",dataArray);
    NSLog(@"dataArray2：%@",dataArray2);

}

- (void)test2 {
    
    NSMutableString *str1 = [NSMutableString stringWithString:@"FlyElephant"];
    NSMutableString *str2 = [NSMutableString stringWithString:@"Keso"];
    
    NSMutableString *str3 = [NSMutableString stringWithString:@"Objective-C"];
    NSMutableString *str4 = [NSMutableString stringWithString:@"Swift"];
    
    NSLog(@"str1:%p  str2:%p str3:%p str4:%p", str1,str2,str3,str4);
    NSMutableArray *dataArray = [NSMutableArray arrayWithObjects:
                                 str1,
                                 str2,
                                 str3,
                                 str4,
                                 nil
                                 ];
    
    NSMutableArray *dataArray2 = [dataArray mutableCopy];
    NSMutableString *mStr;
    
    mStr = dataArray[0];
    [mStr appendString:@"--append"];
    NSLog(@"dataArray：%@",dataArray);
    NSLog(@"dataArray2：%@",dataArray2);
    
    [dataArray addObject:@"test"];
    NSLog(@"dataArray：%@",dataArray);
    NSLog(@"dataArray2：%@",dataArray2);
}

- (void)propertyCopy {
    
    NSMutableString *test = [[NSMutableString alloc] initWithString:@"FlyElephant"];
    
    self.name = test;
    
    self.infoDetail = test;
    
    NSLog(@"name:%@----description:%@",self.name,self.infoDetail);
    
    [test appendString:@"test"];
    NSLog(@"name:%@----description:%@",self.name,self.infoDetail);
}

- (void)classCopy {

    Course *course = [[Course alloc] init];
    course.courseName = @"iOS 学习开发";
    
    Course *copyCourse = [course copy];
    NSLog(@"Course：%@----课程名字:%p",course,course.courseName);
    NSLog(@"CopyCourse: %@----课程名字:%p",copyCourse,copyCourse.courseName);
}


@end
