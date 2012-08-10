//
//  YellowViewController.m
//  06_ViewSwitch
//
//  Created by Raul Zuniga on 5/18/12.
//  Copyright (c) 2012 Accenture. All rights reserved.
//

#import "YellowViewController.h"

@interface YellowViewController ()

@end

@implementation YellowViewController

- (IBAction)yellowButtonPressed
{
    UIAlertView *alert = [[UIAlertView alloc] 
                          initWithTitle:@"Yellow View Button Pressed"
                          message: @"You pressed the button on the yellow view"
                          delegate:nil 
                          cancelButtonTitle:@"Yep, I did" 
                          otherButtonTitles:nil];
    [alert show];
}

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
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
