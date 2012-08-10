//
//  PresidentsDetailViewController.h
//  11_Presidents
//
//  Created by Raul Zuniga on 5/6/12.
//  Copyright (c) 2012 Accenture. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PresidentsDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) UIBarButtonItem *languageButton;
@property (strong, nonatomic) UIPopoverController *languagePopoverController;
@property (copy, nonatomic) NSString *languageString;

-(IBAction)touchLanguageButton;

@end
