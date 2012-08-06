//
//  IconsView.h
//  DoSpringBoardForStoryboard
//
//  Created by zhuang hua on 12-8-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface IconsView : UIView <UIGestureRecognizerDelegate>

@property(nonatomic,retain) UIImage *myIcon;
@property(nonatomic,retain) NSString *myIconName;
@property(nonatomic) BOOL selected;

- (id)initWithFrame:(CGRect)frame name:(NSString *)name fileIcon:(UIImage *)icon;

@end
