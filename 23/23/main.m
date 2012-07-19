//
//  main.m
//  23
//
//  Created by zhuang hua on 12-7-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSFileManager.h>


int main(int argc, const char * argv[])
{

    @autoreleasepool {
            
        NSString *dirName = @"testdir";
        NSString *path;
        NSFileManager *fm;
        
        fm = [NSFileManager defaultManager];
        
        path = [fm currentDirectoryPath];
        NSLog(@"Cuttent directory path is %@", path);
        
        if ([fm createDirectoryAtPath: dirName withIntermediateDirectories: NO attributes: nil error: nil] == NO) {
            NSLog(@"Could not create directory!");
            return 1;
        }
        
        if ([fm moveItemAtPath: dirName toPath: @"newdir" error: nil] == NO) {
            NSLog(@"Directory rename failed!");
            return 2;
        }
        
        if ([fm changeCurrentDirectoryPath: @"newdir"] == NO) {
            NSLog(@"Change directory failed!");
            return 3;
        }
        
        path = [fm currentDirectoryPath];
        NSLog(@"Current directory is %@", path);
        
        NSLog(@"All operations were successful!");
                
    }
    return 0;
}

