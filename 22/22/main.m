//
//  main.m
//  22
//
//  Created by zhuang hua on 12-7-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSFileManager.h>
#import <Foundation/NSData.h>


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSFileManager *fm;
        NSData * fileData;
        
        fm = [NSFileManager defaultManager];
        fileData = [fm contentsAtPath: @"newfile2"];
        
        if (fileData == nil) {
            NSLog(@"File read failed!");
            return 1;
        }
        
        if ([fm createFileAtPath: @"newfile3" contents: fileData attributes:nil] == NO) {
            NSLog(@"Could not create the copy!");
            return 2;
        }
        
        NSLog(@"File copy was successful!");

        
        
    }
    return 0;
}

