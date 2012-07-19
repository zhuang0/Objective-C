//
//  main.m
//  4
//
//  Created by zhuang hua on 12-7-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator: NSObject
{
    double accumulator;
}
-(void) setAccumulator:(double) value;
-(void) clear;
-(double) accumulator;

-(void) add: (double) value;
-(void) subtract:(double) value;
-(void) multiply: (double) value;
-(void) divide: (double) value;


@end


@implementation Calculator

-(void) setAccumulator:(double)value
{
    accumulator =  value;
}

-(void) clear
{
    accumulator = 0;
}

-(double) accumulator
{
    return accumulator;
}

-(void) add:(double)value
{
    accumulator += value;
}

-(void) subtract:(double)value
{
    accumulator -= value;
}

-(void) multiply:(double)value
{
    accumulator *= value;
}

-(void) divide:(double)value
{
    accumulator /= value;
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Calculator *myCalculator;
        myCalculator = [[Calculator alloc] init];
        
        [myCalculator clear];
        [myCalculator setAccumulator: 100.0];
        [myCalculator add: 200.];
        [myCalculator divide: 15.0];
        [myCalculator subtract: 10.0];
        [myCalculator multiply: 5];
        
        NSLog(@"The result is %g", [myCalculator accumulator]);
        
        [myCalculator release];

        
        
    }
    return 0;
}

