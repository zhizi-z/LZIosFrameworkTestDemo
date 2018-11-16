//
//  TestDemo+BaseTypeTest.m
//  IOSFrameworkTestDemo
//
//  Created by zlh on 2018/11/13.
//  Copyright © 2018 zlh. All rights reserved.
//

#import "TestDemo+BaseTypeTest.h"

@implementation TestDemo (BaseTypeTest)

#pragma mark - NSDecimal -
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
    NSLog(@"decimal subtract");
}
//再研究
+ (void)testDecimalDivide
{
    NSDecimal first;
    first._mantissa[0] = 1;
    first._mantissa[1] = 1;
    first._length = 2;
    
    NSDecimal second;
    second._mantissa[0] = 1;
    second._mantissa[1] = 3;
    second._length = 2;
    
    NSDecimal result;
    NSDecimalDivide(&result, &second, &first, NSRoundPlain);
    NSLog(@"decimal divide");
}

+ (void)testDecimalMultiply
{
    NSDecimal first;
    first._mantissa[0] = 1;
    first._mantissa[1] = 1;
    first._length = 2;
    
    NSDecimal second;
    second._mantissa[0] = 1;
    second._mantissa[1] = 3;
    second._length = 2;
    
    NSDecimal result;
    NSDecimalMultiply(&result, &second, &first, NSRoundPlain);
    NSLog(@"decimal multiply");
}

+ (void)testDecimalMultiplyByPowerOf10
{
    NSDecimal first;
    first._mantissa[0] = 1;
    first._mantissa[1] = 1;
    first._length = 2;
    
    NSDecimal result;
    NSDecimalMultiplyByPowerOf10(&result, &first, 2, NSRoundPlain);
    NSLog(@"decimal multiplyByPowerOf10");
}

+ (void)testDecimalRound
{
    NSDecimal first;
    first._exponent = -3;
    first._mantissa[0] = 1;
    first._mantissa[1] = 1;
    first._length = 2;
    
    NSDecimal result;
    NSDecimalRound(&result, &first, 2, NSRoundPlain);
    NSLog(@"decimal round");
}

+ (void)testDecimalPower
{
    NSDecimal first;
    first._exponent = 3;
    first._mantissa[0] = 2;
    first._mantissa[1] = 2;
    first._length = 2;
    
    NSDecimal result;
    NSDecimalPower(&result, &first, 2, NSRoundPlain);
    NSLog(@"decimal power");
}

+ (void)testDecimalNormalize
{
    NSDecimal first;
    first._exponent = 3;
    first._mantissa[0] = 1;
    first._mantissa[1] = 1;
    first._length = 2;
    
    NSDecimal second;
    second._exponent = -3;
    second._mantissa[0] = 1;
    second._mantissa[1] = 3;
    second._length = 2;
    
    NSDecimalNormalize(&first, &second, NSRoundPlain);
    NSLog(@"decimal normalize");
}

+ (void)testDecimalCompare
{
    NSDecimal first;
    first._exponent = 3;
    first._mantissa[0] = 1;
    first._mantissa[1] = 1;
    first._length = 2;
    
    NSDecimal second;
    second._exponent = 3;
    second._mantissa[0] = 1;
    second._mantissa[1] = 2;
    second._length = 2;
    
    NSComparisonResult result = NSDecimalCompare(&first, &second);
    NSLog(@"decimal compare: %ld", (long)result);
}

#pragma mark - NSDecimalNumber -
+ (void)testDecimalNumberByAdding
{
    NSDecimalNumber *first = [NSDecimalNumber decimalNumberWithString:@"12.34e2"];
    NSDecimalNumber *second = [NSDecimalNumber decimalNumberWithString:@"12.345e2"];
    first = [first decimalNumberByAdding:second];
    NSLog(@"decimalNumber byAdding: %@", first);
}

+ (void)testDecimalNumberObjCType
{
    NSDecimalNumber *first = [NSDecimalNumber decimalNumberWithString:@"12.34e2"];
    NSLog(@"decimalNumber objCType: %s", first.objCType);
}

+ (void)testDecimalNumberMaxmumDecimalNumber
{
    NSLog(@"decimalNumber maximumDecimalNumber: %@", NSDecimalNumber.maximumDecimalNumber);
}
@end
