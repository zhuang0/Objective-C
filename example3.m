//
//  example3.m
//  
//
//  Created by zhuang hui on 12-6-30.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//


#import <Foundation/Foundation.h>
 
@interface Complex : NSObject
{
	double real;
	double imaginary;
}

-(void) setReal: (double) a;
-(void) setImaginary: (double) b;
-(void) print;
-(double) real;
-(double) imaginary;

@end

@implementation Complex

-(void) setReal: (double) a
{
	real = a;
}
-(void) setImaginary: (double) b;
{
	imaginary = b;
}
-(void) print
{
	NSLog(@"%f + %fi", real, imaginary);
}
-(double) real
{
	return real;
}
-(double) imaginary
{
	return imaginary;
}

@end

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	Complex *myComplex = [[Complex alloc] init];
	[myComplex setReal: 250];
	[myComplex setImaginary: 250];
	[myComplex print];
	[myComplex release];
	[pool drain];
	return 0;
}

