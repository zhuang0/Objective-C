//
//  main.m
//  13
//
//  Created by zhuang hua on 12-7-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        int p, d;
        BOOL isPrime;
        
        for (p =2; p <= 50; ++p) {
            isPrime = YES;
            
            for (d = 2; d < p; ++d) 
                if (p % d ==0) 
                    isPrime = NO;
                
            if (isPrime ==YES) 
                NSLog(@"%i", p);
            
        }
        
    }
    return 0;
}

