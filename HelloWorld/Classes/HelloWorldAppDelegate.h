//
//  HelloWorldAppDelegate.h
//  HelloWorld
//
//  Created by zhuang hua on 12-6-30.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelloWorldViewController;

@interface HelloWorldAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    HelloWorldViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet HelloWorldViewController *viewController;

@end

