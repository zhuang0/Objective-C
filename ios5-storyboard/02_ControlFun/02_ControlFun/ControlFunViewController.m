//
//  ControlFunViewController.m
//  02_ControlFun
//
//  Created by zhuang hua on 12-8-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ControlFunViewController.h"

@interface ControlFunViewController ()

@end

@implementation ControlFunViewController
@synthesize doSomethingButton;
@synthesize leftSwitch;
@synthesize rightSwitch;
@synthesize nameTextField;
@synthesize numberTextField;
@synthesize showLabel;
@synthesize sliderValueLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIImage *buttonImageNormal = [UIImage imageNamed:@"whiteButton.png"];
    UIImage *stretchableButtonImageNormal = [buttonImageNormal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [self.doSomethingButton setBackgroundImage:stretchableButtonImageNormal forState:UIControlStateNormal];
    
    UIImage *buttonImagePressed = [UIImage imageNamed:@"blueButton.png"];
    UIImage *stretchableButtonImagePressed = [buttonImagePressed stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [self.doSomethingButton setBackgroundImage:stretchableButtonImagePressed forState:UIControlStateHighlighted];
}

- (void)viewDidUnload
{
    [self setNameTextField:nil];
    [self setNumberTextField:nil];
    [self setShowLabel:nil];
    [self setSliderValueLabel:nil];
    [self setDoSomethingButton:nil];
    [self setLeftSwitch:nil];
    [self setRightSwitch:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == nameTextField || textField == numberTextField) {
        [nameTextField resignFirstResponder];
        [numberTextField resignFirstResponder];
    }
    return YES;
}


- (IBAction)show:(id)sender {
    
    showLabel.text = [[NSString alloc] initWithFormat: @"%@ %@", nameTextField.text, numberTextField.text];
}

- (IBAction)changeSliderValue:(id)sender {
    
    UISlider *slider = sender;
    int sliderValue = (int)slider.value;
    int fontSize = sliderValue / 2;
    showLabel.font = [UIFont fontWithName:@"Arial" size: fontSize];
    sliderValueLabel.text = [[NSString alloc] initWithFormat: @"%d", sliderValue];
}

- (IBAction)changeSegmentedControl:(id)sender {
    
    if ([sender selectedSegmentIndex] == 0) {
        self.leftSwitch.hidden = NO;
        self.rightSwitch.hidden = NO;
        self.doSomethingButton.hidden = YES;
    } else {
        self.leftSwitch.hidden = YES;
        self.rightSwitch.hidden = YES;
        self.doSomethingButton.hidden = NO;
    }

}
- (IBAction)tapBackground:(id)sender {
    
    [nameTextField resignFirstResponder];
    [numberTextField resignFirstResponder];
}
- (IBAction)changeSwitchControl:(id)sender {
    
    UISwitch *thisSwitch = sender;
    BOOL setting = thisSwitch.isOn;
    [leftSwitch setOn:setting  animated:YES];
    [rightSwitch setOn:setting animated:YES];

}

- (IBAction)doSomething:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle: @"Are you sure?" delegate:self cancelButtonTitle: @"Cancel" destructiveButtonTitle: @"Yes, I'm Sure!" otherButtonTitles:nil];
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet 
didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != [actionSheet cancelButtonIndex]){
        NSString *msg = nil;
        
        if (nameTextField.text.length > 0) {
            msg = [[NSString alloc] initWithFormat:
                   @"Hi, %@, everything went OK.",
                   nameTextField.text];
        } else {
            msg = @"You haven't input your name, but everything went OK.";
        }
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Something was done" message:msg delegate:nil cancelButtonTitle: @"Ok" otherButtonTitles:nil];
        [alert show];
    }
}


@end
