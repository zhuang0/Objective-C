//
//  AddressBook.m
//  17
//
//  Created by zhuang hua on 12-7-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AddressBook.h"

@implementation AddressBook

-(id) initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        bookName = [[NSString alloc] initWithString: name];
        book = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) addCard:(AddressCard *)theCard
{
    [book addObject: theCard];
}

-(void) deleteCard:(AddressCard *)theCard
{
    [book removeObjectIdenticalTo: theCard];
}

-(int) entries
{
    return [book count];
}

-(void) list
{
    
    NSLog(@"============ List of %@ ==================",bookName);
    
    for (AddressCard *theCard in book) {
        
        NSLog(@"%-20s %-32s", [theCard.name UTF8String], [theCard.email UTF8String]);
        
    }
    NSLog(@"=======================================================");
}

-(void) print
{
    NSLog(@"      Contents of %@ ", bookName);
    NSLog(@"*****************************************");
    for(AddressCard *theCard in book){
    
        [theCard print];
        NSLog(@"\n");
    }
}

-(AddressCard *) findByName:(NSString *)theName
{
    
    AddressCard *searchCard;
    for (searchCard in book){
        if ([searchCard.name caseInsensitiveCompare: theName] == NSOrderedSame) {
            return searchCard;   
        }
    }
    return nil;
    
}

-(void) sort
{
    [book sortUsingSelector: @selector(compareNames:)];
}

    


@end
