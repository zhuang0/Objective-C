#import <Foundation/Foundation.h>

@interface Fraction : NSObject
{
	int numerator;
	int denominator;
}

-(void) print;
-(void) setNumerator: (int) n;
-(void) setDenominator: (int) d;

@end


@implementation Fraction
-(void) print
{
	NSLog(@"%i/%i", numerator, denominator);
}

-(void) setNumerator: (int) n
{
	numerator = n;
}

-(void) setDenominator: (int) d
{
	denominator = d;
}

@end



int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
	
	Fraction *frac1 = [Fraction new];
	Fraction *frac2 = [Fraction new];
	
	[frac1 setNumerator: 2];
	[frac1 setDenominator: 3];
	
	[frac2 setNumerator:3];
	[frac2 setDenominator: 7];
	
	NSLog(@"First fraction is:");
	[frac1 print];
	
	NSLog(@"Second fraction is:");
	[frac2 print];
	
	[frac1 release];
	[frac2 release];
	
    [pool drain];
	
    return 0;
}


