//
//  TestDemoManager.h
//  IOSFrameworkTestDemo
//
//  Created by zlh on 2018/11/9.
//  Copyright © 2018 zlh. All rights reserved.
//

#import <Foundation/Foundation.h>

OBJC_EXPORT void registerTestDemo(Class testDemo);

@interface TestDemoManager : NSObject

+ (instancetype)defaultManager;

+ (instancetype)alloc __attribute__ ((unavailable("call defaultManager instead")));
+ (instancetype)new __attribute__ ((unavailable("call defaultManager instead")));
- (instancetype)copy __attribute__ ((unavailable("call defaultManager instead")));
- (instancetype)mutableCopy __attribute__ ((unavailable("call defaultManager instead")));

- (void)execute;
- (void)execute:(Class)testType;
- (void)execute:(Class)testType test:(SEL)selector;
@end
