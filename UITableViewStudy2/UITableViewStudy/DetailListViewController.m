//
//  DetailListViewController.m
//  UITableViewStudy
//
//  Created by zhuang hua on 12-7-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DetailListViewController.h"

@interface DetailListViewController ()

@end

@implementation DetailListViewController


@synthesize name;
@synthesize selectedKey;
@synthesize dictionary;
@synthesize detailDictionary;
@synthesize detailList;
@synthesize detailNameList;
@synthesize delegate;






- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    isInEditing = YES;
    NSLog(@"%@",name);
    self.title = name;
    NSLog(@"%@",dictionary);
    detailDictionary = [[NSMutableDictionary alloc] initWithDictionary:[dictionary objectForKey: name]];
    detailNameList = (NSMutableArray *) [detailDictionary allKeys];
    detailList = (NSMutableArray *) [detailDictionary allValues];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.detailList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DetailCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.textLabel.text = [self.detailNameList objectAtIndex: indexPath.row];
    cell.detailTextLabel.text = [self.detailList objectAtIndex:indexPath.row];
    return cell;

   }


- (void)DetailAddViewControllerDidCancel:(DetailAddViewController *)detailAddViewController
{
    [self dismissModalViewControllerAnimated: YES];
}

-(void) DetailAddViewController: (DetailAddViewController *) detailAddViewController DidSaveWithItemName: (NSString *)itemName andDetailName: (NSString *) detailName andDetail: (NSString *) detail
{
    
    NSLog(@"Add detail %@:%@ successfully!", detailName
          , detail);
    
    
    detailList = [[NSMutableArray alloc] initWithArray:[detailDictionary allKeys]];
    detailNameList = [[NSMutableArray alloc] initWithArray: [detailDictionary allValues]];

    [detailDictionary setObject:detail forKey:detailName];
    [dictionary setObject:detailDictionary forKey:self.title];
    detailDictionary = [[NSMutableDictionary alloc] initWithDictionary:[dictionary objectForKey: name]];
    detailList = (NSMutableArray *)[detailDictionary allKeys];
    detailNameList = (NSMutableArray *) [detailDictionary allValues];
    [self dismissModalViewControllerAnimated: YES];
    [self.tableView reloadData];

}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString: @"AddDetail"]) {
        
        UINavigationController *nav = (UINavigationController *) segue.destinationViewController;
        DetailAddViewController *detailAddViewController = (DetailAddViewController *) [[nav viewControllers] objectAtIndex: 0];
        detailAddViewController.delegate = self;        
        
        detailAddViewController.name = self.title;
        
        detailAddViewController.delegate = self;
    }
        
            
}

- (IBAction)editDetail:(UIBarButtonItem *)sender {
    
    if(isInEditing){
        [self.tableView setEditing:!self.tableView.editing animated:YES];
        [self.navigationItem.rightBarButtonItem setTitle: @"Save"];
        [self.navigationItem setHidesBackButton:YES];
        NSLog(@"Editing Detail...");
        
    }else{
        
       
        [self.tableView setEditing:!self.tableView.editing animated:NO];
        [self.navigationItem.rightBarButtonItem setTitle: @"Edit"];
        [self.navigationItem setHidesBackButton:NO];
        [self.delegate DetailListViewController: self DidSaveWithItem: name andAllDetail: detailDictionary];
        [self dismissModalViewControllerAnimated: YES];
        
        NSLog(@"Saving Detail...");
    }
    
    [self.tableView reloadData];
    isInEditing = !isInEditing;
}




- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 删除选中行
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        selectedRow = [indexPath row];
        selectedKey = [detailNameList objectAtIndex:selectedRow];
        
        [dictionary removeObjectForKey: name];      
        [detailDictionary removeObjectForKey: selectedKey];              
        [dictionary setObject: detailDictionary forKey: name];
        
        detailList = (NSMutableArray *)[detailDictionary allKeys];
        detailNameList = (NSMutableArray *) [detailDictionary allValues];
        
        [self.tableView reloadData];   
        
        NSLog(@"Deleting detail of %@...", selectedKey);
        
        
        
    }   
}






/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}


@end
