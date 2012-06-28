//
//  Printer.m
//  pro2
//
//  Created by zhuang hua on 12-6-28.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Printer.h"


@implementation Printer

@synthesize printerNumber;

-(void) print
{
	NSLog(@"this is NO.%i printer,it is printing.",[self printerNumber]);

}

@end
