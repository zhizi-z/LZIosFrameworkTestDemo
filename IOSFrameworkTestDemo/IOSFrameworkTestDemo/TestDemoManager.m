//
//  TestDemoManager.m
//  IOSFrameworkTestDemo
//
//  Created by zlh on 2018/11/9.
//  Copyright © 2018 zlh. All rights reserved.
//

#import "TestDemoManager.h"
#import <objc/runtime.h>
#import <objc/message.h>

static NSMutableSet *tests;

void registerTestDemo(Class testDemo)
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (tests == nil)
        {
            tests = [NSMutableSet new];
        }
    });
    [tests addObject:testDemo];
}

@implementation TestDemoManager

+ (instancetype)defaultManager
{
    static TestDemoManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manager == nil)
        {
            manager = [super new];
        }
    });
    return manager;
}

- (void)execute
{
    [tests enumerateObjectsUsingBlock:^(Class  _Nonnull class, BOOL * _Nonnull stop) {
        [self execute:class];
    }];
}

- (void)execute:(Class)testType
{
    unsigned int count;
    const char *clsName = class_getName(testType);
    Class metaClass = objc_getMetaClass(clsName);
    Method *methods = class_copyMethodList(metaClass, &count);
    for (int i = 0; i < count; i++)
    {
        Method method = methods[i];
        SEL selector = method_getName(method);
        [self execute:testType test:selector];
    }
    free(methods);
}

- (void)execute:(Class)testType test:(SEL)selector
{
    NSString *name = NSStringFromSelector(selector);
    if ([name hasPrefix:@"test"])
    {
        ((void (*)(id, SEL))objc_msgSend)(testType, selector);
    }
}
@end
