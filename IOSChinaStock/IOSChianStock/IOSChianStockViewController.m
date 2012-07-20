//
//  IOSChianStockViewController.m
//  IOSChianStock
//
//  Created by zhuang hua on 12-7-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "IOSChianStockViewController.h"

@interface IOSChianStockViewController ()

@end

@implementation IOSChianStockViewController
@synthesize stockTitleTextField;
@synthesize stockNumberTextField;
@synthesize stockDetailTextView;
@synthesize stockTitle;
@synthesize stockNumber;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setStockTitleTextField:nil];
    [self setStockNumberTextField:nil];
    [self setStockDetailTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)showStockDetail:(id)sender {
    
    stockTitle = stockTitleTextField.text;
    stockNumber = stockNumberTextField.text;
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
        
        
        NSString* stockNumberTemp = [NSString stringWithFormat:@"%@",[stockData objectAtIndex:0]];
        NSString* stockNameTemp = [NSString stringWithFormat:@"%@",[stockData objectAtIndex:1]];
        NSString* stockCurrentTemp = [NSString stringWithFormat:@"%@",[stockData objectAtIndex:4]];
        NSString* stockLastdayTemp = [NSString stringWithFormat:@"%@",[stockData objectAtIndex:3]];
        
        
        double current = [[stockData objectAtIndex:4] doubleValue];
        double lastDay = [[stockData objectAtIndex:3] doubleValue];
        double different = current - lastDay;
        double percent = different / lastDay * 100;
        
        
        NSString* stockDifferentTemp = [NSString stringWithFormat:@"%.2f",different];
        NSString* stockPercentTemp = [NSString stringWithFormat:@"%.2f",percent];
        
        
        stockDetailTextView.text = [NSString stringWithFormat: @"代码:%@\n名称:%@\n现时:%@\n昨天:%@\n升降价:%@\n升降率:%@%%", stockNumberTemp, stockNameTemp, stockCurrentTemp, stockLastdayTemp, stockDifferentTemp, stockPercentTemp];
        
    }else{
        
        stockDetailTextView.text = @"No Data";
        
    }
    

}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.stockNumberTextField) {
        [theTextField resignFirstResponder];
    }
    if (theTextField == self.stockTitleTextField) {
        [theTextField resignFirstResponder];
    }
    return YES;
}

@end
