//
//  main.m
//  7
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
        
        int n, number, triangularNumber;
        triangularNumber = 0;
        
        NSLog(@"What triangular bnumber do you want?");
        scanf("%i", &number);
        for(n = 1; n <= number; ++n)        
            triangularNumber += n;
        
        NSLog(@"Triangular number %i is %i\n", number, triangularNumber);
        
        
        
        
    }
    return 0;
}

