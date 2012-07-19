//
//  AddressCard.m
//  17
//
//  Created by zhuang hua on 12-7-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AddressCard.h"

@implementation AddressCard

@synthesize name, email;

-(void) setName:(NSString *)theName andEmail:(NSString *)theEmail
{
    self.name = theName;
    self.email = theEmail;
}

-(void) print
{
    NSLog(@"=========================================");
    NSLog(@"|                                       |");
    NSLog(@"| Name:%-32s |", [name UTF8String]);
    NSLog(@"| Email:%-31s |", [email UTF8String]);
    NSLog(@"|                                       |");
    NSLog(@"|                                       |");
    NSLog(@"|                                       |");
    NSLog(@"|          o                 o          |");
    NSLog(@"=========================================");
}

-(NSComparisonResult) compareNames:(id)element
{
    return [name compare:[element name]];
}

@end
