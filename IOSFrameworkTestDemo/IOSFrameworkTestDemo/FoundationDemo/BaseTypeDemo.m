//
//  BaseTypeDemo.m
//  IOSFrameworkTestDemo
//
//  Created by zlh on 2018/11/8.
//  Copyright © 2018 zlh. All rights reserved.
//

#import "BaseTypeDemo.h"
#import "TestDemoManager.h"

@implementation BaseTypeDemo

+ (void)load
{
    registerTestDemo([self class]);
}

+ (void)testDecimalCopy
{
    NSDecimal target;
    NSDecimal source;
    source._mantissa[0] = 314;
    source._mantissa[6] = 3;
    source._exponent = -1;
    source._isNegative = YES;
    source._length = 6; //设置多少就会拷贝多少个mantissa
    NSDecimalCopy(&target, &source);
    NSLog(@"target is : %p; source is : %p", &target, &source);
}

+ (void)testDecimalString
{
    NSDecimal source;
    source._mantissa[0] = 1;
    source._mantissa[1] = 1;
    source._mantissa[2] = 1;
    source._exponent = 0;
    source._isNegative = NO;
    source._length = 3;
    NSString *decimalString = NSDecimalString(&source, [NSLocale autoupdatingCurrentLocale]);
    NSLog(@"decimalString is %@", decimalString);
}

+ (void)testDecimalCompact
{
    NSDecimal source;
    source._mantissa[0] = 1;
    source._mantissa[1] = 1;
    source._mantissa[2] = 1;
    source._exponent = 0;
    source._isNegative = NO;
    source._length = 3;
    NSDecimalCompact(&source);
    NSLog(@"decimal compat");
}

+ (void)testDecimalAdd
{
    NSDecimal first;
    first._mantissa[0] = 1;
    first._mantissa[1] = 1;
    first._length = 2;
    
    NSDecimal second;
    second._mantissa[0] = 12;
    second._length = 1;
    
    NSDecimal result;
    NSDecimalAdd(&result, &first, &second, NSRoundPlain);
    NSLog(@"decimal add");
}

+ (void)testDecimalSubtract
{
    NSDecimal first;
    first._mantissa[0] = 1;
    first._mantissa[1] = 1;
    first._length = 2;
    
    NSDecimal second;
    second._mantissa[0] = 12;
    second._length = 1;
    
    NSDecimal result;
    NSDecimalAdd(&result, &second, &first, NSRoundPlain);
    NSLog(@"decimal add");
}
@end
