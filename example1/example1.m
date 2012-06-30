#import <Foundation/Foundation.h>

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	int var1, var2;
	var1 = 87;
	var2 = 15;
	NSLog(@"%d - %d = %d", var1, var2, var1 - var2);
	NSLog(@"简单计算。");
	[pool drain];
    return 0;
}
