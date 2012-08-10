//
//  DisclosureButtonController.m
//  09_Nav
//
//  Created by Raul Zuniga on 6/24/12.
//  Copyright (c) 2012 Accenture. All rights reserved.
//

#import "DisclosureButtonController.h"
#import "DisclosureDetailController.h"

@interface DisclosureButtonController ()
@property (strong, nonatomic) DisclosureDetailController *childController;

@end

@implementation DisclosureButtonController

@synthesize list = _list;
@synthesize childController = _childController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString * path = [[NSBundle mainBundle] pathForResource:@"pixar" ofType:@"plist"];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSArray *array = [dictionary objectForKey:@"pixar_films"];
    self.list = array;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.list = nil;
    self.childController = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    return [self.list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *DisclosureButtonCellIdentifier = @"DisclosureButtonCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DisclosureButtonCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DisclosureButtonCellIdentifier];
    }
    
    NSString *rowString = [self.list objectAtIndex:indexPath.row];
    cell.textLabel.text = rowString;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;    
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hey, do you see the disclosure button?" message:@"If you are trying to drill down, touch that instead" delegate:nil cancelButtonTitle:@"Won't happen again" otherButtonTitles: nil];
    
    [alert show];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    if (self.childController == nil) {
        self.childController = [[DisclosureDetailController alloc] initWithNibName:@"DisclosureDetail" bundle:nil];
    }
    self.childController.title = @"Disclosure Button pressed";
    NSString *selectedMovie = [self.list objectAtIndex:indexPath.row];
    NSString *detailMessage = [[NSString alloc] initWithFormat:@"You pressed the disclosure button for %@.", selectedMovie ];
    self.childController.message = detailMessage;
    self.childController.title = selectedMovie;
    [self.navigationController pushViewController:self.childController animated:YES];
}

@end
