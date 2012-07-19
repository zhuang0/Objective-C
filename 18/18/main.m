//
//  main.m
//  18
//
//  Created by zhuang hua on 12-7-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/NSDictionary.h>
#import <Foundation/NSOBject.h>
#import <Foundation/NSString.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSMutableDictionary *glossary = [NSMutableDictionary dictionary];
        [glossary setObject: @"A class defined so other classes can inherit from it" forKey: @"abstract class"];
        [glossary setObject: @"To i,plement all the methods defined in a protocol" forKey: @"adopt"];
        [glossary setObject: @"Storing an object for later use" forKey: @"archiving"];
        
        NSLog(@"abstract class: %@", [glossary objectForKey: @"abstract class"]);
        NSLog(@"adopt: %@", [glossary objectForKey: @"adopt"]);
        NSLog(@"archving: %@", [glossary objectForKey: @"archving"]);
       
        
    }
    return 0;
}

