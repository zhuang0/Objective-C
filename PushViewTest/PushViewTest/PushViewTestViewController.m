//
//  PushViewTestViewController.m
//  PushViewTest
//
//  Created by zhuang hua on 12-8-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PushViewTestViewController.h"
#import "NextViewController.h"




@interface PushViewTestViewController ()

@end

@implementation PushViewTestViewController
@synthesize textField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NextViewController *next = segue.destinationViewController;
    next.string = textField.text;
    
}

@end
