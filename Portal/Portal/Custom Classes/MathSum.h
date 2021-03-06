//
//  MathSum.h
//  swifty
//
//  Created by 想当当 on 14-6-9.
//  Copyright (c) 2014年 想当当. All rights reserved.
//

/*!
 *  使用方式
 *  var mathSum = MathSum()
 *  var sum = mathSum.sum(11, number2: 22)
 */

#import <Foundation/Foundation.h>

@interface MathSum : NSObject

- (NSInteger)sum:(NSInteger)number1 number2:(NSInteger)number2;

- (NSInteger)multiply:(NSInteger)number1 number2:(NSInteger)number2;

@end
