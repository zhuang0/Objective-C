//
//  DependendComponentPickerViewController.m
//  07_Pickers
//
//  Created by Raul Zuniga on 5/26/12.
//  Copyright (c) 2012 Accenture. All rights reserved.
//

#import "DependendComponentPickerViewController.h"

#define kStateComponent 0
#define kZipComponent 1

@interface DependendComponentPickerViewController ()

@end

@implementation DependendComponentPickerViewController
@synthesize picker = _picker;
@synthesize stateZips = _stateZips;
@synthesize states = _states;
@synthesize zips = _zips;

- (IBAction)buttonPressed {
    NSInteger stateRow = [self.picker selectedRowInComponent:kStateComponent];
    NSInteger zipRow = [self.picker selectedRowInComponent:kZipComponent];
    
    NSString *state = [self.states objectAtIndex:stateRow];
    NSString *zip = [self.zips objectAtIndex:zipRow];
    
    NSString *title = [[NSString alloc] initWithFormat:
                       @"You selected zip code %@.", zip];
    NSString *message = [[NSString alloc] initWithFormat:@"%@ is in %@", zip, state];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title 
                                                    message:message 
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.picker.delegate = self;
    self.picker.dataSource = self;
    
    //Do any additional setup after loading the view from its nib
    NSURL *plistURL = [[NSBundle mainBundle] URLForResource:@"statedictionary" withExtension:@"plist"];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    self.stateZips = dictionary;
    NSArray *components = [self.stateZips allKeys];
    NSArray *sorted = [components sortedArrayUsingSelector:@selector(compare:)];
    self.states = sorted;
    
    NSString *selectedState = [self.states objectAtIndex:0];
    NSArray *array = [self.stateZips objectForKey:selectedState];
    self.zips = array;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.picker = nil;
    self.stateZips = nil;
    self.states = nil;
    self.zips = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UIPIckerViewDataSource

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == kStateComponent)
        return [self.states count];
    return [self.zips count];
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView 
             titleForRow:(NSInteger)row 
            forComponent:(NSInteger)component
{
    if (component == kStateComponent)
        return [self.states objectAtIndex:row];
    return [self.zips objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView 
      didSelectRow:(NSInteger)row 
       inComponent:(NSInteger)component
{
    if (component == kStateComponent) {
        NSString *selectedState = [self.states objectAtIndex:row];
        NSArray * array = [self.stateZips objectForKey:selectedState];
        self.zips = array;
        [self.picker selectRow:0 inComponent:kZipComponent animated:YES];
        [self.picker reloadComponent:kZipComponent];
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView 
    widthForComponent:(NSInteger)component 
{
    if (component == kZipComponent) 
        return 90;
    return 200;
} 

@end
