//
//  TypeViewController.h
//  IOSChinaStock2
//
//  Created by zhuang hua on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>





@interface TypeViewController : UIViewController <UITextFieldDelegate> 


@property (strong, nonatomic) IBOutlet UITextField *stockNumberTextField;
@property (strong, nonatomic) IBOutlet UITextField *stockTitleTextField;



@end
