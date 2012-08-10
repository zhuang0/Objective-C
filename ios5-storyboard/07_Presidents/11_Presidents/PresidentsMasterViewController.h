//
//  PresidentsMasterViewController.h
//  11_Presidents
//
//  Created by Raul Zuniga on 5/6/12.
//  Copyright (c) 2012 Accenture. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PresidentsDetailViewController;

@interface PresidentsMasterViewController : UITableViewController

@property (strong, nonatomic) PresidentsDetailViewController *detailViewController;
@property (strong, nonatomic) NSMutableArray *presidents;

@end
