//
//  PresidentsDetailViewController.m
//  11_Presidents
//
//  Created by Raul Zuniga on 5/6/12.
//  Copyright (c) 2012 Accenture. All rights reserved.
//

#import "PresidentsDetailViewController.h"
#import "LanguageListController.h"

@interface PresidentsDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation PresidentsDetailViewController

@synthesize detailItem = _detailItem;
@synthesize webView = _webView;
@synthesize masterPopoverController = _masterPopoverController;

@synthesize  languageButton = _languageButton;
@synthesize languagePopoverController = _languagePopoverController;
@synthesize languageString = _languageString;

#pragma mark - Managing the language button

static NSString *modifyUrlForLanguage(NSString *url, NSString *lang) {
    if (!lang) {
        return url;
    }
    
    // We're relying on a particular Wikipedia URL format here.
    // This is a bit fragile!
    NSRange languageCodeRange = NSMakeRange(7, 2);
    if ([[url substringWithRange:languageCodeRange] isEqualToString:lang]) {
        return url;
    } else {
        NSString *newUrl = [url stringByReplacingCharactersInRange:languageCodeRange withString:lang];
        return newUrl;
    }
}

-(void)setLanguageString:(NSString *)newString
{
    if (![newString isEqualToString:_languageString]) {
        _languageString = [newString copy];
        self.detailItem = modifyUrlForLanguage(_detailItem, self.languageString);
    }
    if (self.languagePopoverController != nil) {
        [self.languagePopoverController dismissPopoverAnimated:YES];
        self.languagePopoverController = nil;
    }
}

-(IBAction)touchLanguageButton
{
    if (self.languagePopoverController == nil) {
        LanguageListController *languageListController = [[LanguageListController alloc] init];
        languageListController.detailViewController = self;
        UIPopoverController *poc = [[UIPopoverController alloc] 
                                    initWithContentViewController:languageListController];
        [poc presentPopoverFromBarButtonItem:self.languageButton 
                    permittedArrowDirections:UIPopoverArrowDirectionAny 
                                    animated:YES];
        self.languagePopoverController = poc;
    } else {
        if (self.languagePopoverController !=nil) {
            [self.languagePopoverController dismissPopoverAnimated:YES];
            self.languagePopoverController = nil;
        }
    }
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
//        _detailItem = newDetailItem;
        _detailItem = modifyUrlForLanguage(newDetailItem, self.languageString);
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.
    NSURL *url = [NSURL URLWithString:self.detailItem];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.languageButton = [[UIBarButtonItem alloc] init];
    self.languageButton.title = @"Choose Language";
    self.languageButton.target = self;
    self.languageButton.action = @selector(touchLanguageButton);
    self.navigationItem.rightBarButtonItem = self.languageButton;
    
    [self configureView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.webView = nil;
    self.languageButton = nil;
    self.languagePopoverController = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - UISplitViewControllerDelegate

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Presidents",@"Presidents");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
