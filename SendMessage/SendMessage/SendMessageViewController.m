//
//  SendMessageViewController.m
//  SendMessage
//
//  Created by zhuang hua on 12-7-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SendMessageViewController.h"

@interface SendMessageViewController ()

@end

@implementation SendMessageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    switch (result) {
        case MessageComposeResultCancelled:
            if (DEBUG) {
                NSLog(@"Result: canceled");
            }
            break;
        case MessageComposeResultSent:
            if (DEBUG) {
                NSLog(@"Result: sent");
            }
            break;
        case MessageComposeResultFailed:
            if (DEBUG) {
                NSLog(@"Result: Failed");
            }
            break;
        default:
            break;
    }
    [self dismissModalViewControllerAnimated: YES];
}

- (IBAction)sendMessage:(id)sender {
    
    BOOL canSendSMS = [MFMessageComposeViewController canSendText];
    NSString *str = [[NSString alloc] initWithFormat: @"YES"];
    
    if (!canSendSMS)    
        str = @"NO";
    
	NSLog(@"can send Message: %@", str);	
	if (canSendSMS) {
        
		MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc] init];
		picker.messageComposeDelegate = self;
		picker.body = @"hello";
		picker.recipients = [NSArray arrayWithObject: @"10086"];
		[self presentModalViewController: picker animated: YES];
			
	}	

}


@end
