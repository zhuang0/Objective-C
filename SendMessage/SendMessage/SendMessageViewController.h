//
//  SendMessageViewController.h
//  SendMessage
//
//  Created by zhuang hua on 12-7-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface SendMessageViewController : UIViewController <MFMessageComposeViewControllerDelegate >
- (IBAction)sendMessage:(id)sender;

@end
