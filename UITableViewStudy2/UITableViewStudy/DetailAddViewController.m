//
//  DetailAddViewController.m
//  UITableViewStudy
//
//  Created by zhuang hua on 12-7-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DetailAddViewController.h"

@interface DetailAddViewController ()

@end

@implementation DetailAddViewController

@synthesize name;
@synthesize detailNameTextField;
@synthesize detailContentTextField;
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
    self.title = [[NSString alloc] initWithFormat:@"%@ Detail", name];
	NSLog(@"Adding detail...");
}

- (void)viewDidUnload
{
    [self setDetailNameTextField:nil];
    [self setDetailContentTextField:nil];
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
    
    if (detailNameTextField.text.length > 0 && detailContentTextField.text.length > 0) {
        
        
        [self.delegate DetailAddViewController: self DidSaveWithItemName:name andDetailName: detailNameTextField.text andDetail:detailContentTextField.text];
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
    if (textField == self.detailNameTextField) {
        [textField resignFirstResponder];
    }
    if (textField == self.detailContentTextField) {
        [textField resignFirstResponder];
    }
    return YES;
}

@end
