//
//  SingleComponentPickerViewController.h
//  07_Pickers
//
//  Created by Raul Zuniga on 5/26/12.
//  Copyright (c) 2012 Accenture. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleComponentPickerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *singlePicker;
@property (strong, nonatomic) NSArray *pickerData;

- (IBAction)buttonPressed;

@end
