//
//  HelloWorldViewController.m
//  HelloWorld
//
//  Created by zhuang hua on 12-7-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HelloWorldViewController.h"

@interface HelloWorldViewController ()

@end

@implementation HelloWorldViewController
@synthesize showLabel;
@synthesize yourNameTextField;
@synthesize yourName;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setYourNameTextField:nil];
    [self setShowLabel:nil];
    [self setShowLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)changeGreeting:(id)sender {
          
        self.yourName = self.yourNameTextField.text;
    
        NSString *nameString = self.yourName;
        if ([nameString length] == 0) {
            nameString = @"World";
        }
        NSString *greeting = [[NSString alloc] initWithFormat:@"Hello, %@!", nameString];
        self.showLabel.text = greeting;    
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.yourNameTextField) {
        [theTextField resignFirstResponder];
    }
    return YES;
}
@end
