//
//  main.m
//  12
//
//  Created by zhuang hua on 12-7-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        int p, d, isPrime;
        
        for (p = 2; p <= 50; ++p) {
            isPrime = 1;
            
            for (d = 2; d < p; ++d) 
                if (p % d == 0) 
                    isPrime = 0;
            
            if (isPrime != 0) 
                NSLog(@"%i", p);
            
                                    
            
        }
        
    }
    return 0;
}

