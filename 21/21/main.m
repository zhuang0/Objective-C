//
//  main.m
//  21
//
//  Created by zhuang hua on 12-7-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSFileManager.h>
#import <Foundation/NSDictionary.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *fName = @"testfile";
        NSFileManager *fm;
        NSDictionary *attr;
        
        fm = [NSFileManager defaultManager];
        
        if ([fm fileExistsAtPath: fName] == NO) {
            NSLog(@"File does not exist!");
            return 1;
        }
        
        if ([fm copyItemAtPath: fName toPath: @"newfile" error: nil] == NO) {
            NSLog(@"File copy Failed");
            return 2;
        }
        
        if ([fm contentsEqualAtPath: fName andPath: @"newfile"] == NO) {
           NSLog(@"Files are not equal!");
            return 3;
        }
        
        if ([fm moveItemAtPath: @"newfile" toPath: @"newfile2" error: nil] == NO) {
            NSLog(@"File rename failed!");
            return 4;
        }
        
        if ((attr = [fm attributesOfItemAtPath: @"newfile2" error: nil]) == nil) {
            NSLog(@"Could not get file attributes!");
            return 5;
        }
        
        NSLog(@"File size is %i bytes",[[attr objectForKey: NSFileSize] intValue]);
    
       if ([fm removeItemAtPath: fName error: nil] == NO) {
           NSLog(@"File removal failed!");
           return 6;
        }
        
        NSLog(@"All operations were successful!");
        NSLog(@"%@", [NSString stringWithContentsOfFile: @"newfile2" encoding:NSUTF8StringEncoding error: nil]);
    }
    return 0;
}

