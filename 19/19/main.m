//
//  main.m
//  19
//
//  Created by zhuang hua on 12-7-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSDictionary.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSDictionary *glossary = 
            [NSDictionary dictionaryWithObjectsAndKeys:
             @"A class defined so other classes can inherit from it", @"abstract class",
             @"To implement all the methods defined in  protocol", @"adopt",
             @"Storing an object for later use", @"archving",
             nil
             ];
        for (NSString *key in glossary) 
            NSLog(@"%@: %@", key, [glossary objectForKey: key]);
        
        
    }
    return 0;
}

