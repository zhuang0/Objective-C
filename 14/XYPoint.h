//
//  XYPoint.h
//  14
//
//  Created by zhuang hua on 12-7-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYPoint : NSObject
{
    int x;
    int y;
}

@property int x, y;

-(void) setX: (int) xVal andY: (int) yVal;

@end
