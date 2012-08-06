//
//  IconsView.m
//  DoSpringBoardForStoryboard
//
//  Created by zhuang hua on 12-8-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "IconsView.h"

@implementation IconsView

@synthesize myIcon;
@synthesize myIconName;
@synthesize selected;

-(void)singleTap:(UITapGestureRecognizer *)sender{
	selected = !selected;
	[self setNeedsDisplay];
}


- (id)initWithFrame:(CGRect)frame name:(NSString *)name fileIcon:(UIImage *)icon
{
    self = [super initWithFrame: frame];
    if (self) {
        myIconName = name;
		myIcon = icon;
		selected = NO;
		self.backgroundColor = [UIColor clearColor];
		UITapGestureRecognizer *singleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:) ];
		singleTapGesture.delegate = self;
		[self addGestureRecognizer:singleTapGesture];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect{
     //CGContextRef context = UIGraphicsGetCurrentContext();
     int margin = (rect.size.width -57 ) / 2;
     CGRect iconRect = CGRectMake(margin, margin, 57, 57);
     CGRect textRect = CGRectMake(0, rect.size.height -16 , rect.size.width, 16);
     if (selected) {
         [myIcon drawInRect: iconRect blendMode:kCGBlendModeHardLight alpha: 0.3];
     }else{
         [myIcon drawInRect: iconRect];
     }
     [myIconName drawInRect: textRect withFont:[UIFont systemFontOfSize: 12] lineBreakMode:UILineBreakModeMiddleTruncation alignment:UITextAlignmentCenter];
 
 }

@end
