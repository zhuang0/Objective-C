//
//  main.m
//  11
//
//  Created by zhuang hua on 12-7-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        int number, right_digit;
        
        NSLog(@"Enter your number:");
        
        scanf("%i", &number);
        
        do {
            right_digit = number % 10;
            NSLog(@"%i", right_digit);
            number /= 10;
        } while (number != 0);
        
    }
    return 0;
}

