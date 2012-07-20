//
//  HelloWorldViewController.h
//  HelloWorld
//
//  Created by zhuang hua on 12-7-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloWorldViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *showLabel;

@property (weak, nonatomic) IBOutlet UITextField *yourNameTextField;
@property (copy, nonatomic) NSString *yourName; 
- (IBAction)changeGreeting:(id)sender;

@end
