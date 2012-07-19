//
//  Rectangle.h
//  14
//
//  Created by zhuang hua on 12-7-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XYPoint;

@interface Rectangle : NSObject
{
    int width;
    int height;
    XYPoint *origin;
}

@property int width, height;

-(XYPoint *) origin;
-(void) setOrigin: (XYPoint *) pt; 
-(void) setWidth: (int) w andHeight: (int) h;
-(int) area;
-(int) perimeter;

@end
