//
//  DisclosureDetailController.m
//  09_Nav
//
//  Created by Raul Zuniga on 6/24/12.
//  Copyright (c) 2012 Accenture. All rights reserved.
//

#import "DisclosureDetailController.h"

@interface DisclosureDetailController ()

@end

@implementation DisclosureDetailController

@synthesize label = _label;
@synthesize message = _message;

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	self.label.text = self.message;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.label = nil;
    self.message = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
