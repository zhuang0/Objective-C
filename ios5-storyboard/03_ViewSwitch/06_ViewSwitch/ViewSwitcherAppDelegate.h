//
//  ViewSwitcherAppDelegate.h
//  06_ViewSwitch
//
//  Created by Raul Zuniga on 5/18/12.
//  Copyright (c) 2012 Accenture. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwitchViewController;

@interface ViewSwitcherAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SwitchViewController * switchViewController;

@end
