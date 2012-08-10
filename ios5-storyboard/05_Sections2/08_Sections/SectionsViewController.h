//
//  SectionsViewController.h
//  08_Sections
//
//  Created by Raul Zuniga on 6/17/12.
//  Copyright (c) 2012 Accenture. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, weak) IBOutlet UITableView *table;
@property (nonatomic, weak) IBOutlet UISearchBar *search;
@property (nonatomic, strong) NSDictionary *allNames;
@property (nonatomic, strong) NSMutableDictionary *names;
@property (nonatomic, strong) NSMutableArray *keys;

- (void) resetSearch;
- (void) handleSearchForTerm:(NSString *)searchTerm;

@end
