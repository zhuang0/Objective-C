//
//  DoSpringBoardViewController.h
//  DoSpringBoardForStoryboard
//
//  Created by zhuang hua on 12-8-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IconsView.h"

@interface DoSpringBoardViewController : UIViewController <UIScrollViewDelegate>

@property(nonatomic,retain)  NSMutableArray *files;
@property (strong, nonatomic) IBOutlet UIScrollView *desk;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@property(nonatomic) CGFloat deskWidth;
@property(nonatomic) CGFloat deskHeight;

@end
