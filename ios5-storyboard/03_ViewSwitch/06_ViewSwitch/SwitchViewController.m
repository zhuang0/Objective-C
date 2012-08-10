//
//  SwitchViewController.m
//  06_ViewSwitch
//
//  Created by Raul Zuniga on 5/18/12.
//  Copyright (c) 2012 Accenture. All rights reserved.
//

#import "SwitchViewController.h"
#import "BlueViewController.h"
#import "YellowViewController.h"

@interface SwitchViewController ()

@end

@implementation SwitchViewController

@synthesize  yellowViewController = _yellowViewController;
@synthesize blueViewController = _blueViewController;

- (IBAction)switchViews:(id)sender
{
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:1.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    if (self.yellowViewController.view.superview == nil) {
        if (self.yellowViewController == nil) 
            self.yellowViewController = [[YellowViewController alloc] initWithNibName:@"YellowView" bundle:nil];
        
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                               forView:self.view 
                                 cache:YES];
        
        [self.blueViewController.view removeFromSuperview];
        [self.view insertSubview:self.yellowViewController.view atIndex:0];
    } else {
        if (self.blueViewController == nil) 
            self.blueViewController = [[BlueViewController alloc] initWithNibName:@"BlueView" bundle:nil];
        
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                               forView:self.view 
                                 cache:YES];
        
        [self.yellowViewController.view removeFromSuperview];
        [self.view insertSubview:self.blueViewController.view atIndex:0];
    }
    [UIView commitAnimations];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.blueViewController = [[BlueViewController alloc] initWithNibName:@"BlueView" bundle:nil];
    [self.view insertSubview:self.blueViewController.view atIndex:0];
}

- (void) didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc, that aren't in use
    if (self.blueViewController.view.superview == nil) {
        self.blueViewController = nil;
    } else {
        self.yellowViewController = nil;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
