//
//  DoSpringBoardViewController.m
//  DoSpringBoardForStoryboard
//
//  Created by zhuang hua on 12-8-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DoSpringBoardViewController.h"

@interface DoSpringBoardViewController ()

@end

@implementation DoSpringBoardViewController

@synthesize files;
@synthesize desk;
@synthesize pageControl;
@synthesize deskWidth;
@synthesize deskHeight;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    files = [NSMutableArray arrayWithCapacity:99];
	NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *allfiles = [fileManager contentsOfDirectoryAtPath:[ [NSBundle bundleForClass:[DoSpringBoardViewController  class]] bundlePath  ] error:nil];	
    //NSArray *allfiles = [fileManager contentsOfDirectoryAtPath: @"Icons" error:nil];
	for (int i = 0; i < [allfiles count]; i++) {
		NSString *s = [allfiles objectAtIndex: i];
		if ( [s hasSuffix: @".png"] ) {
			[files addObject: s];
		}
	}
	
	
	//UIImage *imageSource = [UIImage imageNamed:@"Icons"];
	
	deskWidth = desk.frame.size.width;
	deskHeight = desk.frame.size.height;
  
    
	for (UIView *subView in desk.subviews) {
		[subView removeFromSuperview];
	}
	
	desk.contentSize = CGSizeMake(deskWidth, deskHeight);
	
	CGFloat iconViewSizeHeight = 88;
    CGFloat iconViewSizeWidth = 80;
	int col = 0; 
    int row = 0; 
    int page = 0;
	CGRect lastRect;
    
	for (int i = 0; i < [files count]; i++) {
        //获取文件名（包括扩展名）
		NSString *fname = [files objectAtIndex: i];
        //去除扩展名
		fname = [[fname lastPathComponent] stringByDeletingPathExtension];
        
		CGRect rect = CGRectMake(page * deskWidth + col * iconViewSizeWidth, row * iconViewSizeHeight, iconViewSizeWidth, iconViewSizeHeight);
		lastRect = rect;
		if (rect.origin.x >= (page+1) * deskWidth && rect.origin.y < deskHeight) {
			row = row + 1;
            col = 0;
			rect = CGRectMake(page * deskWidth + col * iconViewSizeWidth, row * iconViewSizeHeight, iconViewSizeWidth, iconViewSizeHeight);
		}
		if (rect.origin.y >= deskHeight) {
			row = 0; col = 0; page = page + 1;
			rect = CGRectMake(page * deskWidth + col * iconViewSizeWidth, row*iconViewSizeHeight, iconViewSizeWidth, iconViewSizeHeight);
			
		}		 
		col = col + 1;
		IconsView *icon = [[IconsView alloc] initWithFrame: rect name: fname fileIcon: [UIImage imageNamed: fname]];
		[desk addSubview: icon];
		
	}
	
	int totalPage = floor((lastRect.origin.x - deskWidth / 2) / deskWidth) + 1;   
	desk.contentSize = CGSizeMake(deskWidth * totalPage, deskHeight);
    pageControl.numberOfPages = totalPage;    
	pageControl.currentPage = 0;

}

- (void)scrollViewDidScroll:(UIScrollView *)sender{
    
    pageControl.currentPage =  floor((desk.contentOffset.x - deskWidth / 2) / deskWidth) + 1;
   
}


- (void)viewDidUnload
{
    [self setDesk:nil];
    [self setDesk:nil];
    [self setPageControl:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

@end
