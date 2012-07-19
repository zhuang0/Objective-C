//
//  main.m
//  MyChinaStock
//
//  Created by zhuang hua on 12-7-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *stockNumber = @"600050";
        NSString *stockTitle = @"sh";
        
        NSString* urlText = [NSString stringWithFormat:@"http://hq.sinajs.cn/list=%@%@",stockTitle,stockNumber];
        
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
            
            
           
            NSLog(@"代码:%@",stockNumberTemp);
            NSLog(@"名称:%@",stockNameTemp);
            NSLog(@"现时:%@",stockCurrentTemp);
            NSLog(@"昨天:%@",stockLastdayTemp);
            NSLog(@"升降价:%@,",stockDifferentTemp);
            NSLog(@"升降率:%@%%",stockPercentTemp);
            
                        
            
            
        }else{
            
            NSLog(@"No Data");
            
        }
        
           
        
    
    }
    return 0;
}

