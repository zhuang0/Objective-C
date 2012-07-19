//
//  main.m
//  5
//
//  Created by zhuang hua on 12-7-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        int n, triangularNumber;
        triangularNumber = 0;
        
        for(n = 1; n <= 200; n++)
            triangularNumber += n;
        
        NSLog(@"The triangular number is %i", triangularNumber);
        
        
            
        
        
    }
    return 0;
}

