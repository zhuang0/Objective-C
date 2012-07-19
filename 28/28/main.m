//
//  main.m
//  28
//
//  Created by zhuang hua on 12-7-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        int exit = 0;
        char stockNumberchar[20];
        char stockTitlechar[20];
        
        while (exit == 0) {
        
        NSLog(@"Input stock number and stock title:");
        scanf("%s %s", &stockNumberchar, &stockTitlechar);
        
        NSString *stockNumber = [NSString stringWithUTF8String: stockNumberchar];
        NSString *stockTitle = [NSString stringWithUTF8String: stockTitlechar];
        
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
        
        //条件语句，当股票代码的首标题为“sh”时，注意此处判断回复的数据的不同，区分上证和深证
        if([stockTitle isEqualToString:@"sh"]){
            
            
            retStr = [retStr stringByReplacingOccurrencesOfString:@"var hq_str_sh" withString:@""];
            
        }else{
            
            //定义回复的文字，把文字中的@"var hq_str_sz" withString:@""
            retStr = [retStr stringByReplacingOccurrencesOfString:@"var hq_str_sz" withString:@""];
            
        }//读取接口数据－完成
        
        //创建数组对象，定义数组内容为网站的回复文字，并使用“,”将内容依次划分到数组中
        NSArray* stockData = [NSArray arrayWithArray:[retStr componentsSeparatedByString:@","]]; 
        
        //条件语句，判断回复的数据是否存在，当数组大于“2”时，表示数据存在
        if(stockData.count > 2){
            
            //创建临时的文字对象，定义为股票的数据内容
            NSString* stockNumberTemp = [NSString stringWithFormat:@"%@",[stockData objectAtIndex:0]];
            NSString* stockNameTemp = [NSString stringWithFormat:@"%@",[stockData objectAtIndex:1]];
            NSString* stockCurrentTemp = [NSString stringWithFormat:@"%@",[stockData objectAtIndex:4]];
            NSString* stockLastdayTemp = [NSString stringWithFormat:@"%@",[stockData objectAtIndex:3]];
            
            //计算股票的升幅数据
            double current = [[stockData objectAtIndex:4] doubleValue];
            double lastDay = [[stockData objectAtIndex:3] doubleValue];
            double different = current - lastDay;
            double percent = different / lastDay * 100;
            
            //创建临时的文字对象，定义为股票的数据内容
            NSString* stockDifferentTemp = [NSString stringWithFormat:@"%.2f",different];
            NSString* stockPercentTemp = [NSString stringWithFormat:@"%.2f",percent];
            
            
            //在调试拦输出运行结果
            NSLog(@"代码:%@",stockNumberTemp);
            NSLog(@"名称:%@",stockNameTemp);
            NSLog(@"现时:%@",stockCurrentTemp);
            NSLog(@"昨天:%@",stockLastdayTemp);
            NSLog(@"升降价:%@,",stockDifferentTemp);
            NSLog(@"升降率:%@%%",stockPercentTemp);
            
            //定义可变的数组对象，添加股票的数据
                        //刷新股票的表格对象
            
            
            //当数组小于或等于“2”时
        }else{
            //在调试拦输出运行结果
            NSLog(@"No Data");
            
        }
            NSLog(@"Do you want to exit?0/1");
            scanf("%d", &exit);
            if (exit == 1) {
                NSLog(@"end");
            }
        }
    }
    return 0;
}

