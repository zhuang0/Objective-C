//
//  IconsView.h
//  DoSpringBoardForStoryboard
//
//  Created by zhuang hua on 12-8-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>



@interface IconsView : UIView <UIGestureRecognizerDelegate>

@property (nonatomic, retain) UIImage *myIcon;
@property (nonatomic, retain) NSString *myIconName;
@property (nonatomic) BOOL selected;
@property (nonatomic, retain) ALAsset *asset;
@property (nonatomic, retain) UIImageView *overlayView;

- (id)initWithFrame:(CGRect)frame name:(NSString *)name fileIcon:(UIImage *)icon;
;
-(BOOL)selected;

@end
