//
//  main.m
//  6
//
//  Created by zhuang hua on 12-7-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        int n, triangularNumber = 0;
        
        NSLog(@"TABLE OF TRIANGULAR NUMBERS");
        NSLog(@"n Sum from 1 to n");
        NSLog(@"-----------------");
        
        for(n = 1; n <= 10; ++n)
        {
            triangularNumber += n;
            NSLog(@"%i\t%i", n, triangularNumber);
        
        }
        
    }
    return 0;
}

