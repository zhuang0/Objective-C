#import <Foundation/Foundation.h>

@interface XYpoint : NSObject
{
	int xpoint;
	int ypoint;
}

-(void) setXpoint: (int) x;
-(void) setYpoint: (int) y;
-(int) xpoint;
-(int) xpoint;

@end

@implementation XYpoint

-(void) setXpoint: (int) x
{
	self->xpoint = x;
}
-(void) setYpoint: (int) y
{
	self->ypoint = y;
}
-(int) xpoint
{
	return xpoint;
}
-(int) ypoint
{
	return ypoint;
}

@end



int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	XYpoint *myXYpoint = [[XYpoint alloc] init];
	
	[myXYpoint setXpoint: 23];
	[myXYpoint setYpoint: 45];
	
	NSLog(@"该点的的笛卡尔坐标是：(%d,%d)", [myXYpoint xpoint], [myXYpoint ypoint]);
	
	[myXYpoint release];
	
    [pool drain];
    return 0;
}
