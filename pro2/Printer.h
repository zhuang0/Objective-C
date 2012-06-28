//
//  Printer.h
//  pro2
//
//  Created by zhuang hua on 12-6-28.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Printer : NSObject {

	int printerNumber;
	
}

@property int printerNumber;

-(void) print;

@end
