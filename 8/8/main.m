//
//  main.m
//  8
//
//  Created by zhuang hua on 12-7-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        //NSLog(@"Hello, World!");
        
        int n, number, triangularNUmber, counter;
        
        for(counter = 1; counter <= 5; ++counter) {
            NSLog(@"What triangular number do you want?");
            scanf("%i", &number);
            
            triangularNUmber = 0;
            for(n = 1; n <= number; ++n) 
                triangularNUmber += n;
        
            NSLog(@"Triangular number %i is %i", number, triangularNUmber);
        }
       
    }
    return 0;
}

