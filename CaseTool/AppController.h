//
//  AppController.h
//  CaseTool
//
//  Created by zhuang hua on 12-6-30.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AppController : NSObject {
	IBOutlet NSTextField *textField;
	IBOutlet NSTextField *resultsField;	
}

-(IBAction) uppercase: (id) sender;
-(IBAction) lowercase: (id) sender;

@end

