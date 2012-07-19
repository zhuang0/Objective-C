//
//  main.m
//  14
//
//  Created by zhuang hua on 12-7-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Rectangle.h"
#import "XYPoint.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        
        Rectangle *myRect = [[Rectangle alloc] init];
        XYPoint *myPoint = [[XYPoint alloc] init];
        
        [myPoint setX: 100 andY: 200];
        [myRect setWidth: 5 andHeight: 8];
        myRect.origin = myPoint;
        
        NSLog(@"Rectangle width = %i, height = %i", myRect.width, myRect.height);
        NSLog(@"Origin at (%i, %i)",myRect.origin.x, myRect.origin.y);
        NSLog(@"Area = %i, Perimeter = %i",[myRect area], [myRect perimeter]);
        
    }
    return 0;
    
}
