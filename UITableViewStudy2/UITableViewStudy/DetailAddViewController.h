//
//  DetailAddViewController.h
//  UITableViewStudy
//
//  Created by zhuang hua on 12-7-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailAddViewController;

@protocol DetailAddViewControllerDelegate <NSObject>


-(void) DetailAddViewControllerDidCancel: (DetailAddViewController *) detailAddViewController;
-(void) DetailAddViewController: (DetailAddViewController *) detailAddViewController DidSaveWithItemName: (NSString *)itemName andDetailName: (NSString *) detailName andDetail: (NSString *) detail;


@end

@interface DetailAddViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) NSString *name;
@property (strong, nonatomic) IBOutlet UITextField *detailNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *detailContentTextField;
@property (nonatomic, weak) id <DetailAddViewControllerDelegate> delegate;
- (IBAction)didCancel:(id)sender;
- (IBAction)didSave:(id)sender;



@end
