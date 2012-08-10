//
//  DoubleComponentPickerViewController.h
//  07_Pickers
//
//  Created by Raul Zuniga on 5/26/12.
//  Copyright (c) 2012 Accenture. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoubleComponentPickerViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIPickerView *doublePicker;
@property (strong, nonatomic) NSArray *fillingTypes;
@property (strong, nonatomic) NSArray *breadTypes;

- (IBAction)buttonPressed;

@end
