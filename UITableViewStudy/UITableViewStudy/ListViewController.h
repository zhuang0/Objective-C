//
//  ListViewController.h
//  UITableViewStudy
//
//  Created by zhuang hua on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "AddViewController.h"

@interface ListViewController : UITableViewController <AddViewControllerDelegate, UIActionSheetDelegate> {
    
    BOOL isInEditing;
    NSUInteger selectedRow;
    
}


@property NSMutableArray *list;


- (IBAction)editTable:(UIBarButtonItem *)sender;

@end
