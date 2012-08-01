//
//  ListViewController.m
//  UITableViewStudy
//
//  Created by zhuang hua on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ListViewController.h"


@interface ListViewController ()

@end

@implementation ListViewController 

@synthesize list;
@synthesize addBarButton;
@synthesize dictionary;
@synthesize detailDictionary;
@synthesize detailList;
@synthesize detailNameList;




- (IBAction)editTable:(UIBarButtonItem *)sender {
    
    
    if(isInEditing){
        [self.tableView setEditing:!self.tableView.editing animated:YES];
        [self.navigationItem.rightBarButtonItem setTitle: @"Save"];
         NSLog(@"Editing...");
        
    }else{
        
        isInEditing = NO;
        [self.tableView setEditing:!self.tableView.editing animated:NO];
        [self.navigationItem.rightBarButtonItem setTitle: @"Edit"];
         NSLog(@"Saving...");
       

    }
    [self.tabBarItem setEnabled:!isInEditing];
    [self.tableView reloadData];
    isInEditing = !isInEditing;
    
    
}   
    
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 删除选中行
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        selectedRow = [indexPath row];
         NSString *selectedKey = [list objectAtIndex:selectedRow];
        [list removeObjectAtIndex:selectedRow];// 从数组中删除对应的数据
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [dictionary removeObjectForKey: selectedKey];
        NSLog(@"Deleting %@...", selectedKey);

       
        		
    }   
}




-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)
sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    NSUInteger fromRow = [sourceIndexPath row]; 
    NSUInteger toRow = [destinationIndexPath row]; 
    
    id object = [self.list objectAtIndex:fromRow]; 
    [self.list removeObjectAtIndex:fromRow]; 
    [self.list insertObject:object atIndex:toRow]; 
}


- (void) AddViewController: (AddViewController *)addViewController DidSaveWith:(NSString *)sth
{
    
    
    NSLog(@"Add %@ successfully!", sth);
    NSDictionary *addSth = [[NSDictionary alloc] init];
    [self.dictionary setObject:addSth forKey:sth];
    [self dismissModalViewControllerAnimated: YES];
    list = [[NSMutableArray alloc] initWithArray: [dictionary allKeys]]; 
    [self.tableView reloadData];
    
    
 
    
}



- (void)AddViewControllerDidCancel: (AddViewController *)addViewController
{
    [self dismissModalViewControllerAnimated: YES];
}


-(void) DetailAddViewController: (DetailAddViewController *) detailAddViewController DidSaveWithItemName: (NSString *)itemName andDetailName: (NSString *) detailName andDetail: (NSString *) detail
{
   
    detailDictionary = [dictionary objectForKey:itemName];
    detailList = [detailDictionary allKeys];
    detailNameList = [detailDictionary allValues];
    [self.detailDictionary setObject:detail forKey:detailName];
    detailList = [[NSMutableArray alloc] initWithArray:[detailDictionary allKeys]];
    detailNameList = [[NSMutableArray alloc] initWithArray: [detailDictionary allValues]];
    NSDictionary *addDetail = [[NSDictionary alloc] initWithObjectsAndKeys:detail, detailName, nil];
    [detailDictionary setObject:addDetail forKey:detailName];
    [dictionary setObject:detailDictionary forKey:self.title];
    [self dismissModalViewControllerAnimated: YES];
    [self.tableView reloadData];
}



- (void)DetailAddViewControllerDidCancel:(DetailAddViewController *)detailAddViewController
{
    [self dismissModalViewControllerAnimated: YES];
}

-(void) DetailListViewController: (DetailAddViewController *) detailAddViewController DidSaveWithItem:(NSString *)itemName andAllDetail:(NSMutableDictionary *)allDetail
{
    
   
    [dictionary removeObjectForKey: itemName];
    [dictionary setObject: allDetail forKey:itemName];
    [self dismissModalViewControllerAnimated: YES];
    [self.tableView reloadData];
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString: @"Details"]) {
        UITableViewCell *cell = (UITableViewCell *) sender;
        NSUInteger row = [self.tableView indexPathForCell: cell].row;
        DetailListViewController *detailListViewController = (DetailListViewController *) [segue destinationViewController];
        detailListViewController.name = [self.list objectAtIndex:row];
        detailListViewController.dictionary = self.dictionary;
       
        
    }else if ([segue.identifier isEqualToString: @"AddSth"]) {
        UINavigationController *nav = (UINavigationController *) segue.destinationViewController;
        AddViewController *addViewController = (AddViewController *) [[nav viewControllers] objectAtIndex: 0];
        addViewController.delegate = self;
    }

    

}

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
    NSString *path = [[NSBundle mainBundle] pathForResource:@"List" ofType:@"plist"];//找到该plist的路径  
    // NSLog(@"%@",path);  
    dictionary = [[NSMutableDictionary alloc]initWithContentsOfFile:path];
    
    isInEditing = YES;
    self.title = @"List";
    
    list = [[NSMutableArray alloc] initWithArray: [dictionary allKeys]]; 
    

    
}

- (void)viewDidUnload
{
    
    
    [self setAddBarButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - Table view data source

//set the number of sections in table
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

//get the number of rows in section
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.list count];
} 

//
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSString * cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    cell.textLabel.text = [self.list objectAtIndex: indexPath.row];
    return cell;
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
