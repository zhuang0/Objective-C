//
//  main.m
//  pro2
//
//  Created by zhuang hua on 12-6-28.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Printer.h"

int main(int argc, char *argv[])
{
	NSAutoreleasePool * pool =[[NSAutoreleasePool alloc] init];
	
	Printer *printer1 = [Printer new];
	Printer *printer2 = [Printer new];
	
	printer1.printerNumber = 1;
	printer2.printerNumber = 2;
	
	[printer1 print];
	[printer2 print];
	
	[printer1 release];
	[printer2 release];
	
	[pool drain];
	
    return NSApplicationMain(argc,  (const char **) argv);
}
