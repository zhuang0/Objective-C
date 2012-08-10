//
//  DatePickerViewController.m
//  07_Pickers
//
//  Created by Raul Zuniga on 5/26/12.
//  Copyright (c) 2012 Accenture. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

@synthesize datePicker = _datePicker;

- (IBAction)buttonPressed
{
    NSDate *selected = [self.datePicker date];
    
    // Format the date
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateStyle = NSDateFormatterLongStyle;
    NSString * date = [formatter stringFromDate:selected];
    
    NSString *message = [[NSString alloc] initWithFormat:@"The date and time you selected is: %@", date];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Date and Time Selected" 
                                                    message:message 
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.datePicker setDate:[NSDate date] animated:NO];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.datePicker = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
