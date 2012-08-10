//
//  LanguageListController.m
//  11_Presidents
//
//  Created by Raul Zuniga on 5/8/12.
//  Copyright (c) 2012 Accenture. All rights reserved.
//

#import "LanguageListController.h"
#import "PresidentsDetailViewController.h"

@interface LanguageListController ()

@end

@implementation LanguageListController

@synthesize detailViewController = _detailViewController;
@synthesize languageCodes = _languageCodes;
@synthesize languageNames = _languagenames;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.languageNames = [NSArray arrayWithObjects:@"English", @"French", @"German", @"Spanish", nil];
    self.languageCodes = [NSArray arrayWithObjects:@"en", @"fr", @"de", @"es", nil];
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, [self.languageCodes count] * 44.0);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.detailViewController = nil;
    self.languageNames = nil;
    self.languageCodes = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.languageCodes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text = [self.languageNames objectAtIndex:[indexPath row]];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.detailViewController.languageString = [self.languageCodes objectAtIndex:indexPath.row];
}

@end
