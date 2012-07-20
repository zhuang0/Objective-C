//
//  IOSChianStockViewController.h
//  IOSChianStock
//
//  Created by zhuang hua on 12-7-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IOSChianStockViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *stockTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *stockNumberTextField;
@property (weak, nonatomic) IBOutlet UITextView *stockDetailTextView;
@property NSString *stockTitle;
@property NSString *stockNumber;
- (IBAction)showStockDetail:(id)sender;

@end
