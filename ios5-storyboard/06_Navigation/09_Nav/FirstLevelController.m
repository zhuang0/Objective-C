//
//  FirstLevelController.m
//  09_Nav
//
//  Created by Raul Zuniga on 6/23/12.
//  Copyright (c) 2012 Accenture. All rights reserved.
//

#import "FirstLevelController.h"
#import "SecondLevelController.h"
#import "DisclosureButtonController.h"

@interface FirstLevelController ()
@end

@implementation FirstLevelController

@synthesize controllers = _controllers;

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.title = @"First Level";
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    // Disclosure Button
    DisclosureButtonController *disclosureButtonController = [[DisclosureButtonController alloc] initWithStyle:UITableViewStylePlain];
    disclosureButtonController.title = @"Disclosure Buttons";
    disclosureButtonController.rowImage = [UIImage imageNamed:@"disclosureButtonControllericon.png"];
    [array addObject:disclosureButtonController];
    
    self.controllers = array;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.controllers = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.controllers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FirstLevelCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (!cell) {
        cell = [[UITableViewCell alloc ] 
                initWithStyle:UITableViewCellStyleDefault 
                reuseIdentifier:CellIdentifier];
    }
    
    SecondLevelController *controller = [self.controllers objectAtIndex:indexPath.row];
    cell.textLabel.text = controller.title;
    cell.imageView.image = controller.rowImage;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondLevelController *nextController = [self.controllers objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:nextController animated:YES];
}

@end
