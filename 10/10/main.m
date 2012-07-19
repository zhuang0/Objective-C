//
//  main.m
//  10
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
        
        while (number != 0) {
            right_digit = number % 10;
            NSLog(@"%i", right_digit);
            number /= 10;
            
        }
       
        
    }
    return 0;
}

