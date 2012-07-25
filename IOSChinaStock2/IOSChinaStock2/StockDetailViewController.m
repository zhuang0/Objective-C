//
//  StockDetailViewController.m
//  IOSChinaStock2
//
//  Created by zhuang hua on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//



#import "StockDetailViewController.h"



@interface StockDetailViewController ()

@end

@implementation StockDetailViewController 


@synthesize stockDetail;



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
    
    NSLog(@"view2%@%@", stockTitle, stockNumber);
    
    NSString *stockNameTemp;
    NSString *stockNumberTemp;
    NSString *stockCurrentTemp;
    NSString *stockYesterdayTemp;
    NSString *stockDifferentTemp;
    NSString *stockPercentTemp;
    
    NSString* urlText = [NSString stringWithFormat:@"http://hq.sinajs.cn/list=%@%@", stockTitle, stockNumber];
    
    NSURL *url =[NSURL URLWithString:urlText];
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc]initWithURL:url];
    
    [urlRequest setHTTPMethod:@"GET"];
    
    NSURLResponse *response;
    
    NSError *error;
    
    NSData *recieveData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
    
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    
    NSString *retStr = [[NSString alloc] initWithData:recieveData encoding:enc];
    
    
    retStr = [retStr stringByReplacingOccurrencesOfString:@"=\"" withString:@","];
    
    
    if([stockTitle isEqualToString:@"sh"]){
        
        
        retStr = [retStr stringByReplacingOccurrencesOfString:@"var hq_str_sh" withString:@""];
        
    }else{
        
        
        retStr = [retStr stringByReplacingOccurrencesOfString:@"var hq_str_sz" withString:@""];
        
    }
    
    
    NSArray* stockData = [NSArray arrayWithArray:[retStr componentsSeparatedByString:@","]]; 
    
    
    if(stockData.count > 2){
        
        
        stockNumberTemp = [NSString stringWithFormat:@"%@",[stockData objectAtIndex:0]];
        stockNameTemp = [NSString stringWithFormat:@"%@",[stockData objectAtIndex:1]];
        stockCurrentTemp = [NSString stringWithFormat:@"%@",[stockData objectAtIndex:4]];
        stockYesterdayTemp = [NSString stringWithFormat:@"%@",[stockData objectAtIndex:3]];
        
        
        double current = [[stockData objectAtIndex:4] doubleValue];
        double lastDay = [[stockData objectAtIndex:3] doubleValue];
        double different = current - lastDay;
        double percent = different / lastDay * 100;
        
        
        stockDifferentTemp = [NSString stringWithFormat:@"%.2f",different];
        stockPercentTemp = [NSString stringWithFormat:@"%.2f",percent];
        
        
        
        
    }else{
        
        stockNumberTemp = @"Not Found";
        stockNameTemp = @"Not Found";
        stockCurrentTemp = @"No Data";
        stockYesterdayTemp = @"No Data";
        stockDifferentTemp = @"No Data";
        stockPercentTemp = @"No Data";
        
        NSLog(@"No Data!");
        
        
    }
    

    stockDetail = [[NSMutableArray alloc] initWithCapacity: [self.stockDetail count]];
    
    [stockDetail addObject: [NSString stringWithFormat: @"代码:    %@", stockNumberTemp]];
    [stockDetail addObject: [NSString stringWithFormat: @"名称:    %@", stockNameTemp]];
    [stockDetail addObject: [NSString stringWithFormat: @"现时:    %@", stockCurrentTemp]];
    [stockDetail addObject: [NSString stringWithFormat: @"昨天:    %@", stockYesterdayTemp]];
    [stockDetail addObject: [NSString stringWithFormat: @"升降价: %@", stockDifferentTemp]];
    [stockDetail addObject: [NSString stringWithFormat: @"升降率: %@%%", stockPercentTemp]];
    
    NSLog(@"代码:%@\n名称:%@\n现时:%@\n昨天:%@\n升降价:%@\n升降率:%@%%",stockNumberTemp, stockNameTemp, stockCurrentTemp, stockYesterdayTemp, stockDifferentTemp, stockPercentTemp);
       
     

}

- (void)viewDidUnload
{
    [self setStockDetail: nil];
   
    
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self.stockDetail count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.textLabel.text = [self.stockDetail objectAtIndex: indexPath.row];
    
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
