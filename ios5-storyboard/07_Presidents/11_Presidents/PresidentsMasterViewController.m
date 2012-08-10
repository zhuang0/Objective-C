//
//  PresidentsMasterViewController.m
//  11_Presidents
//
//  Created by Raul Zuniga on 5/6/12.
//  Copyright (c) 2012 Accenture. All rights reserved.
//

#import "PresidentsMasterViewController.h"

#import "PresidentsDetailViewController.h"

@interface PresidentsMasterViewController () 
@property (nonatomic, strong) NSMutableArray *objects;

@end

@implementation PresidentsMasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize presidents = _presidents;
@synthesize objects = _objects;

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"PresidentList" ofType:@"plist"];
    NSDictionary *presidentsInfo = [NSDictionary dictionaryWithContentsOfFile:path];
    self.presidents = [presidentsInfo objectForKey:@"presidents"];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.detailViewController = (PresidentsDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.presidents = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.presidents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"Master List Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] 
                initWithStyle:UITableViewCellStyleDefault 
                reuseIdentifier:Identifier];
    }
    
    //Configure the cell
    NSDictionary *president = [self.presidents objectAtIndex:indexPath.row];
    cell.textLabel.text = [president objectForKey:@"name"];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.presidents removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } 
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *president = [self.presidents objectAtIndex:indexPath.row];
    NSString *urlString = [president objectForKey:@"url"];
    self.detailViewController.detailItem = urlString;
    
}

@end
