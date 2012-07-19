//
//  main.m
//  15
//
//  Created by zhuang hua on 12-7-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/NSObject.h>
#import <Foundation/NSArray.h>
#import <Foundation/NSString.h>
#import <Foundation/NSAutoreleasePool.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        int i;
        NSArray *monthNames = [NSArray arrayWithObjects: @"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December", nil];
        
        NSLog(@"Month     Name");
        NSLog(@"=====   ========");
        
        for (i = 0; i < 12; i++) {
            NSLog(@"%4i    %@", i + 1, [monthNames objectAtIndex: i]);
        }
        
        
    }
    return 0;
}

