//
//  NextViewController.m
//  PushViewTest
//
//  Created by zhuang hua on 12-8-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

@synthesize string;
@synthesize label;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    label.text = string;
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
