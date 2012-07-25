//
//  TypeViewController.m
//  IOSChinaStock2
//
//  Created by zhuang hua on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TypeViewController.h"



@interface TypeViewController ()

@end

@implementation TypeViewController 

@synthesize stockNumberTextField;
@synthesize stockTitleTextField;


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    stockTitle = [[NSString alloc] initWithFormat: stockTitleTextField.text ];
    stockNumber = [[NSString alloc] initWithFormat: stockNumberTextField.text];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
   
     NSLog(@"view1 start %@%@", stockTitle, stockNumber);
    
    
    
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

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.stockNumberTextField) {
        [theTextField resignFirstResponder];
    }
    if (theTextField == self.stockTitleTextField) {
        [theTextField resignFirstResponder];
    }
    return YES;
}





@end
