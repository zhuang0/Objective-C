//
//  main.m
//  17
//
//  Created by zhuang hua on 12-7-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import "AddressBook.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        AddressBook *myBook = [AddressBook alloc];
        
        NSString *aName = @"Zhuang Hui";
        NSString *aEmail = @"sheen.zhuang@gmail.com";
        NSString *bName = @"Li Si";
        NSString *bEmail = @"lisi@gmail.com";
        NSString *cName = @"Tony";
        NSString *cEmail = @"tony@gmail.com";
        NSString *dName = @"Jamie";
        NSString *dEmail = @"jamie@gmail.com";
        
        AddressCard *card1 = [[AddressCard alloc] init];
        AddressCard *card2 = [[AddressCard alloc] init];
        AddressCard *card3 = [[AddressCard alloc] init];
        AddressCard *card4 = [[AddressCard alloc] init];
        AddressCard *myCard;
        
        [card1 setName: aName andEmail: aEmail];
        [card2 setName: bName andEmail: bEmail];
        [card3 setName: cName andEmail: cEmail];
        [card4 setName: dName andEmail: dEmail];
        
        myBook = [myBook initWithName: @"My Address Book"];
        
        NSLog(@"Entries in address book after creation: %i\n", [myBook entries]);
        
        [myBook addCard: card1];
        [myBook addCard: card2];
        [myBook addCard: card3];
        [myBook addCard: card4];
        
        NSLog(@"Entries in address book after adding cards: %i\n", [myBook entries]);
        
        [myBook list];NSLog(@"\n"); 
        [myBook sort];
        [myBook list];
        [myBook print];NSLog(@"\n");
        
        NSLog(@"look up: Tony");        
        myCard = [myBook findByName: @"Tony"];        
        if (myCard == nil) {
            NSLog(@"Sorry, not found!");
        }
        else [myCard print];
        
        NSLog(@"delete: Tony"); 
        [myBook deleteCard: myCard];
        NSLog(@"deleting...");
        [myBook list];
       

    }
    return 0;
}

