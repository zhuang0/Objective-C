//
//  AddViewController.h
//  UITableViewStudy
//
//  Created by zhuang hua on 12-7-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class AddViewController;

@protocol AddViewControllerDelegate <NSObject>

-(void) AddViewController: (AddViewController *) addViewController DidSaveWith: (NSString *) sth;
-(void) AddViewControllerDidCancel: (AddViewController *) addViewController;


@end


@interface AddViewController : UIViewController <UITextFieldDelegate>


@property (strong, nonatomic) IBOutlet UITextField *addTextField;
@property (nonatomic, weak) id <AddViewControllerDelegate> delegate;

- (IBAction)didCancel:(id)sender;
- (IBAction)didSave:(id)sender;

@end
