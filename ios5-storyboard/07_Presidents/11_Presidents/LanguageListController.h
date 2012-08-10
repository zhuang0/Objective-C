//
//  LanguageListController.h
//  11_Presidents
//
//  Created by Raul Zuniga on 5/8/12.
//  Copyright (c) 2012 Accenture. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PresidentsDetailViewController;

@interface LanguageListController : UITableViewController

@property (weak, nonatomic) PresidentsDetailViewController *detailViewController;
@property (strong, nonatomic) NSArray *languageCodes;
@property (strong, nonatomic) NSArray *languageNames;

@end
