//
//  main.m
//  24
//
//  Created by zhuang hua on 12-7-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/NSString.h>
#import <Foundation/NSFileManager.h>
#import <Foundation/NSArray.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
            
        NSString *path;
        NSString *files;
        NSFileManager *fm;
        NSDirectoryEnumerator *dirEnum;
        NSArray *dirArray;
        
        fm = [NSFileManager defaultManager];
        path = [fm currentDirectoryPath];
        dirEnum = [fm enumeratorAtPath: path];
        
        NSLog(@"Contents of %@: ",path);
        
        while ((files = [dirEnum nextObject]) != nil) {
            NSLog(@"%@", files);
            BOOL flag;
            [fm fileExistsAtPath: path  isDirectory: &flag];
            if (flag == YES) {
                [dirEnum skipDescendents];
            }
        
        }
        
        dirArray = [fm contentsOfDirectoryAtPath: [fm currentDirectoryPath] error:nil];
        NSLog(@"Contents using contentsOfDirectoryAtPath: ");
        
        //for (files in dirArray) {
        //    NSLog(@"%@ ", files);
        //}
        NSLog(@"%@", dirArray);
    
        
    }
    return 0;
}

