//
//  SwitchViewController.h
//  06_ViewSwitch
//
//  Created by Raul Zuniga on 5/18/12.
//  Copyright (c) 2012 Accenture. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YellowViewController;
@class BlueViewController;

@interface SwitchViewController : UIViewController

@property (strong, nonatomic) YellowViewController *yellowViewController;
@property (strong, nonatomic) BlueViewController *blueViewController;

- (IBAction)switchViews:(id)sender;

@end
