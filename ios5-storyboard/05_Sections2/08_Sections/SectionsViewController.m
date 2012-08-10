//
//  SectionsViewController.m
//  08_Sections
//
//  Created by Raul Zuniga on 6/17/12.
//  Copyright (c) 2012 Accenture. All rights reserved.
//

#import "SectionsViewController.h"
#import "NSDictionary+MutableDeepCopy.h"

@interface SectionsViewController ()

@end

@implementation SectionsViewController
@synthesize  table = _table;
@synthesize search = _search;
@synthesize allNames = _allNames;
@synthesize names = _names;
@synthesize keys = _keys;


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)resetSearch
{
    self.names = [self.allNames mutableDeepCopy];
    NSMutableArray *keyArray = [[NSMutableArray alloc] init];
    [keyArray addObjectsFromArray:[[self.allNames allKeys] sortedArrayUsingSelector:@selector(compare:)]];
    self.keys = keyArray;
}

- (void)handleSearchForTerm:(NSString *)searchTerm
{
    NSMutableArray *sectionsToRemove = [[NSMutableArray alloc] init];
    [self resetSearch];
    
    for (NSString *key in self.keys) {
        NSMutableArray *array = [self.names valueForKey:key];
        NSMutableArray *toRemove = [[NSMutableArray alloc] init];
        
        for (NSString *name in array) {
            if ([name rangeOfString:searchTerm 
                            options:NSCaseInsensitiveSearch].location == NSNotFound)
                [toRemove addObject:name];
        }
        if ([array count] == [toRemove count])
            [sectionsToRemove addObject:key];
        
        [array removeObjectsInArray:toRemove];
    }
    
    [self.keys removeObjectsInArray:sectionsToRemove];
    [self.table reloadData];
}

#pragma mark - View Controller life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString * path = [[NSBundle mainBundle]pathForResource:@"sortednames" ofType:@"plist"];
    
    NSDictionary *dictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    self.allNames = dictionary;
    
    [self resetSearch];
//    [self.table reloadData];
//    [self.table setContentOffset:CGPointMake(0, 44.0) animated:NO];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.names = nil;
    self.keys = nil;
    self.table = nil;
    self.search = nil;
    self.allNames = nil;
}

#pragma mark - UITableviewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"Number of sections = %d",[self.keys count]);
    return ([self.keys count] > 0) ? [self.keys count] : 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self.keys count] == 0)
        return 0;
    NSString *key = [self.keys objectAtIndex:section];
    NSArray *nameSection = [self.names objectForKey:key];
    NSLog(@"Number of rows in section = %d",[nameSection count]);
    return [nameSection count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *key = [self.keys objectAtIndex:indexPath.section];
    NSArray *nameSection = [self.names objectForKey:key];
    
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] 
                initWithStyle:UITableViewCellStyleDefault 
                reuseIdentifier:identifier];        
    }
    cell.textLabel.text = [nameSection objectAtIndex:indexPath.row];
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if ([self.keys count] == 0 )
        return nil;
        
    NSString *key = [self.keys objectAtIndex:section];
    return key;
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.keys;
}

#pragma mark - UITableViewDelegate

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    [self.search resignFirstResponder];
    return indexPath;
}

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *searchTerm = [searchBar text];
    [self handleSearchForTerm:searchTerm];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if ([searchText length] ==0) {
        [self resetSearch];
        [self.table reloadData];
        return;
    }
    [self handleSearchForTerm:searchText];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    self.search.text = @"";
    [self resetSearch];
    [self.table reloadData];
    [searchBar resignFirstResponder];
}


@end
