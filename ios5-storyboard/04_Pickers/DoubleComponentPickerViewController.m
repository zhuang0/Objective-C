//
//  DoubleComponentPickerViewController.m
//  07_Pickers
//
//  Created by Raul Zuniga on 5/26/12.
//  Copyright (c) 2012 Accenture. All rights reserved.
//

#import "DoubleComponentPickerViewController.h"

#define kFillingComponent 0
#define kBreadComponent 1

@interface DoubleComponentPickerViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
@end

@implementation DoubleComponentPickerViewController

@synthesize doublePicker = _doublePicker;
@synthesize fillingTypes = _fillingTypes;
@synthesize breadTypes = _breadTypes;

- (IBAction)buttonPressed 
{
    
    NSInteger fillingRow = [self.doublePicker selectedRowInComponent:kFillingComponent];
    NSInteger breadRow = [self.doublePicker selectedRowInComponent:kBreadComponent];
     
    NSString *bread = [self.breadTypes objectAtIndex:breadRow];
    NSString *filling = [self.fillingTypes objectAtIndex: fillingRow];
     
    NSString *message = [[NSString alloc] initWithFormat:@"Your %@ on %@ will be right up.", filling, bread];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank you for our order" 
                                                    message:message 
                                                   delegate:nil 
                                          cancelButtonTitle:@"Great" 
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.doublePicker.delegate = self;
    self.doublePicker.dataSource = self;
     
    NSArray *fillingArray = [[NSArray alloc] initWithObjects:@"Ham", @"Turkey", @"Peanut Butter", @"Tuna Salad", @"Chicken Salad", @"Roast Beaf", @"Vegemite", nil];
    self.fillingTypes = fillingArray;
     
    NSArray *breadArray = [[NSArray alloc] initWithObjects:@"White", @"Whole Wheat", @"Rye", @"Sourdough", @"Seven Grain", nil];
    self.breadTypes = breadArray;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.doublePicker = nil;
    self.fillingTypes = nil;
    self.breadTypes = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


 #pragma mark - UIPickerViewDataSource
 
 // returns the number of 'columns' to display.
 - (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
 {
     return 2;
 }
 
 // returns the # of rows in each component..
 - (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
 {
     if (component == kBreadComponent)
         return [self.breadTypes count];
 
     return [self.fillingTypes count];
 }
 
#pragma mark - UIPickerViewDelegate

 - (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
 {
     if (component == kBreadComponent)
         return [self.breadTypes objectAtIndex:row];
     return [self.fillingTypes objectAtIndex:row];
 }
 
@end
