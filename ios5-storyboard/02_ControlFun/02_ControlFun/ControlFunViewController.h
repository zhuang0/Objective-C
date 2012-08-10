//
//  ControlFunViewController.h
//  02_ControlFun
//
//  Created by zhuang hua on 12-8-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ControlFunViewController : UIViewController <UITextFieldDelegate, UIActionSheetDelegate>

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *numberTextField;
@property (strong, nonatomic) IBOutlet UILabel *showLabel;
@property (strong, nonatomic) IBOutlet UILabel *sliderValueLabel;
@property (strong, nonatomic) IBOutlet UIButton *doSomethingButton;
@property (strong, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *rightSwitch;

- (IBAction)show:(id)sender;
- (IBAction)changeSliderValue:(id)sender;
- (IBAction)changeSegmentedControl:(id)sender;
- (IBAction)tapBackground:(id)sender;
- (IBAction)changeSwitchControl:(id)sender;
- (IBAction)doSomething:(id)sender;

@end
