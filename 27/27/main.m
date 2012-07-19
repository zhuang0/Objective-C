//
//  main.m
//  27
//
//  Created by zhuang hua on 12-7-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSFileHandle.h>
#import <Foundation/NSFileManager.h>
#import <Foundation/NSData.h>


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSFileHandle *inFile, *outFile;
        NSData *buffer;
        
        inFile = [NSFileHandle fileHandleForReadingAtPath: @"testfile"];
        
        if (inFile == nil) {
            NSLog(@"Open of testfile for reading failed");
            return 1;
        }
        
        [[NSFileManager defaultManager] createFileAtPath: @"testout" contents: nil attributes: nil];
        
        outFile = [NSFileHandle fileHandleForWritingAtPath: @"testout"];
        
        if (outFile == nil) {
            NSLog(@"Open of testout for writing failed");
            return 2;
        }
        
        [outFile truncateFileAtOffset: 0];
        
        buffer = [inFile readDataToEndOfFile];
        
        [outFile writeData: buffer];
        
        [inFile closeFile];
        [outFile closeFile];
        
        NSLog(@"%@",[NSString stringWithContentsOfFile: @"testout" encoding:NSUTF8StringEncoding error: nil]);
        
    }
    return 0;
}

