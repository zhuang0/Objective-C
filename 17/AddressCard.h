//
//  AddressCard.h
//  17
//
//  Created by zhuang hua on 12-7-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>

@interface AddressCard : NSObject
{
    NSString    *name;
    NSString    *email;
}

@property (copy, nonatomic) NSString *name, *email;

-(void) setName:(NSString *) theName andEmail: (NSString *) theEmail;
-(void) print;
-(NSComparisonResult) compareNames: (id) element;



@end
