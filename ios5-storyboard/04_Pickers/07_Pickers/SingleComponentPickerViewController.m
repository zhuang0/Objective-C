//
//  SingleComponentPickerViewController.m
//  07_Pickers
//
//  Created by Raul Zuniga on 5/26/12.
//  Copyright (c) 2012 Accenture. All rights reserved.
//

#import "SingleComponentPickerViewController.h"

@interface SingleComponentPickerViewController ()

@end

@implementation SingleComponentPickerViewController

@synthesize singlePicker = _singlePicker;
@synthesize pickerData = _pickerData;


- (IBAction)buttonPressed
{
    NSInteger row = [self.singlePicker selectedRowInComponent:0];
    NSString *selected = [self.pickerData objectAtIndex:row];
    NSString *title = [[NSString alloc] initWithFormat:@"You selected %@!", selected];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title 
                                                    message:@"Thank you for choosing" 
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.singlePicker.delegate = self;
    self.singlePicker.dataSource = self;
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"Luke", @"Leia", @"Han", @"Chewbacca", @"Artoo", @"Artoo", @"Threepio", @"Lando", nil];
    self.pickerData = array;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.singlePicker = nil;
    self.pickerData = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.pickerData count];
    
}

#pragma mark - UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView 
             titleForRow:(NSInteger)row 
            forComponent:(NSInteger)component    
{
    id selection = [self.pickerData objectAtIndex:row];
    if ([selection isKindOfClass:[NSString class]]) 
        return [self.pickerData objectAtIndex:row];
    else 
        return nil;
}

@end
