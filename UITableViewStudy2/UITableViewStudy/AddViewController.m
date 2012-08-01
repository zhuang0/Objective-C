//
//  AddViewController.m
//  UITableViewStudy
//
//  Created by zhuang hua on 12-7-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController


@synthesize addTextField;
@synthesize delegate;

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
    NSLog(@"Adding...");
    
	
}

- (void)viewDidUnload
{
    [self setAddTextField: nil];
    [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)didCancel:(id)sender {
    [self dismissModalViewControllerAnimated: YES];
    NSLog(@"Canceling...");
}

- (IBAction)didSave:(id)sender {
    
    if (addTextField.text.length > 0) {
        
        [self.delegate AddViewController: self DidSaveWith: addTextField.text];
        [self dismissModalViewControllerAnimated: YES];
        NSLog(@"Saving...");
       
    }else {
        
        UIAlertView *dialog  = [[UIAlertView alloc] initWithTitle: @"Warning" message: @"Input can't be empty,\nplease input again!" delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil, nil];
        [dialog show];
        NSLog(@"Input can't be empty!");

}
    
}



-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.addTextField) {
        [textField resignFirstResponder];
    }
    return YES;
}

@end
