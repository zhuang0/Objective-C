//
//  main.m
//  9
//
//  Created by zhuang hua on 12-7-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        unsigned int u, v, temp;
        
        NSLog(@"Please type in two nonnegtive integers:");
        scanf("%u%u", &u, &v);
        
        while (v != 0) {
            temp = u % v;
            u = v;
            v =temp;
        }
        
        NSLog(@"There greatest common divisor is %u", u);
    }
    return 0;
}

