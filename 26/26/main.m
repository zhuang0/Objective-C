//
//  main.m
//  26
//
//  Created by zhuang hua on 12-7-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>
#import <Foundation/NSFileManager.h>
#import <Foundation/NSPathUtilities.h>
#import <Foundation/NSProcessInfo.h>


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSFileManager *fm;
        NSString *source, *dest;
        BOOL isDir;
        NSProcessInfo *proc = [NSProcessInfo processInfo];
        NSArray *args = [proc arguments];
        
        fm = [NSFileManager defaultManager];
        
        if ([args count] != 3) {
            NSLog(@"Usage: %@ src dest", [proc processName]);
            return 1;
        }
        
        source = [args objectAtIndex: 1];
        dest = [args objectAtIndex: 2];
        
        if ([fm isReadableFileAtPath: source] == NO) {
            NSLog(@"Can't read %@", source);
            return 2;
        }
        
        [fm fileExistsAtPath: dest isDirectory: &isDir];
        
        if (isDir == YES) 
            dest = [dest stringByAppendingPathComponent: [source lastPathComponent]];
          
        [fm removeItemAtPath: dest error: nil];
        
        if ([fm copyItemAtPath: source toPath: dest error: nil] == NO) {
            NSLog(@"Copy failed!");
            return 3;
        }
        
        NSLog(@"Copy of %@ to %@ succeeded!", source, dest);
            
        
        
    }
    return 0;
}

