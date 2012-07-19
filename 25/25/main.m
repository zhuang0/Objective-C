//
//  main.m
//  25
//
//  Created by zhuang hua on 12-7-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/NSString.h>
#import <Foundation/NSArray.h>
#import <Foundation/NSFileManager.h>
#import <Foundation/NSPathUtilities.h>


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *fName = @"path.m";
        NSFileManager *fm;
        NSString *path, *tempdir, *extension, *homedir, *fullpath;
        NSString *upath = @"~zhuanghua/Desktop/../Products/./path.m";
        
        NSArray *components;
        
        fm = [NSFileManager defaultManager];
        tempdir = NSTemporaryDirectory();
        NSLog(@"Temporary Directory is %@", tempdir);
        
        path = [fm currentDirectoryPath];
        NSLog(@"Base dir is %@", [path lastPathComponent]);
        
        fullpath = [path stringByAppendingPathComponent: fName];
        NSLog(@"fullpath to %@ is %@", fName, fullpath);
        
        extension = [fullpath pathExtension];
        NSLog(@"extension for %@ is %@", fullpath, extension);
        
        homedir = NSHomeDirectory();
        NSLog(@"Your home directory is %@", homedir);
        
        components = [homedir pathComponents];
        
        for (path in components) 
            NSLog(@"%@", path);
        
        NSLog(@"%@ => %@", upath, [upath stringByStandardizingPath]);
        
    
    
    }
    return 0;
}

