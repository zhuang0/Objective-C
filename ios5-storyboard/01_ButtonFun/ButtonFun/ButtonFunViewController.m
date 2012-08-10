//
//  ButtonFunViewController.m
//  ButtonFun
//
//  Created by zhuang hua on 12-8-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ButtonFunViewController.h"

@interface ButtonFunViewController ()

@end

@implementation ButtonFunViewController
@synthesize label;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setLabel:nil];
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)buttonPress:(id)sender {
    UIButton *button = sender;
    label.text = [[NSString alloc] initWithFormat: @"%@ button was pressed", button.currentTitle];
}
@end
