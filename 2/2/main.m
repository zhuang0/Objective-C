//
//  main.m
//  2
//
//  Created by zhuang hua on 12-7-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        int a = 25, b = 5, c = 10, d = 7;
        
        NSLog(@"a %% b = %i", a % b);
        NSLog(@"a %% c = %i", a % c);
        NSLog(@"a %% d = %i", a % d);
        NSLog(@"a /d * d + a %% d = %i", a / d * d + a % d);
        
    }
    return 0;
}

