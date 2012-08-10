//
//  DependendComponentPickerViewController.h
//  07_Pickers
//
//  Created by Raul Zuniga on 5/26/12.
//  Copyright (c) 2012 Accenture. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DependendComponentPickerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) NSDictionary *stateZips;
@property (strong, nonatomic) NSArray *states;
@property (strong, nonatomic) NSArray *zips;

- (IBAction)buttonPressed;

@end
