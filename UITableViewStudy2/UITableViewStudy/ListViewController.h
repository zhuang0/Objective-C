//
//  ListViewController.h
//  UITableViewStudy
//
//  Created by zhuang hua on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailListViewController.h"
#import "AddViewController.h"

@interface ListViewController : UITableViewController <AddViewControllerDelegate,DetailAddViewControllerDelegate,DetailListViewControllerDelegate> {
    
    BOOL isInEditing;
    NSUInteger selectedRow;
    
}


@property NSMutableDictionary *dictionary;
@property NSMutableDictionary *detailDictionary;
@property NSArray *detailList;
@property NSArray *detailNameList;
@property NSMutableArray *list;


@property (strong, nonatomic) IBOutlet UIBarButtonItem *addBarButton;


- (IBAction)editTable:(UIBarButtonItem *)sender;

@end
