//
//  DatePickerViewController.h
//  07_Pickers
//
//  Created by Raul Zuniga on 5/26/12.
//  Copyright (c) 2012 Accenture. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickerViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)buttonPressed;

@end
