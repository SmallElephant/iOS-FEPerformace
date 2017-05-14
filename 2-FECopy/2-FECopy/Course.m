//
//  Course.m
//  2-FECopy
//
//  Created by keso on 2017/5/14.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "Course.h"

@interface Course()<NSCopying>

@end

@implementation Course

- (id)copyWithZone:(NSZone *)zone {
    Course *course = [[Course allocWithZone:zone] init];
    course.courseName = [self.courseName mutableCopy];
    return course;
}

@end
