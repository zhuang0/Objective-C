//
//  AddressBook.h
//  17
//
//  Created by zhuang hua on 12-7-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/NSArray.h>
#import "AddressCard.h"

@interface AddressBook : NSObject
{
    NSString *bookName;
    NSMutableArray *book;
}

-(id) initWithName: (NSString *) name;
-(void) addCard: (AddressCard *) theCard;
-(void) deleteCard: (AddressCard *) theCard;
-(int) entries;
-(void) list;
-(void) print;
-(AddressCard *) findByName: (NSString *) theName;
-(void) sort;



@end
