//
//  TestDemo.m
//  IOSFrameworkTestDemo
//
//  Created by zlh on 2018/11/9.
//  Copyright © 2018 zlh. All rights reserved.
//

#import "TestDemo.h"

@implementation TestDemo

+ (void)load
{
    registerTestDemo([self class]);
    NSLog(@"registerTestDemo %p, %p", self, [self class]);
}
@end
