//
//  DetailListViewController.h
//  UITableViewStudy
//
//  Created by zhuang hua on 12-7-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailAddViewController.h"

@class DetailListViewController;

@protocol DetailListViewControllerDelegate <NSObject>

-(void) DetailListViewController: (DetailListViewController *) detailListViewController DidSaveWithItem: (NSString *) itemName andAllDetail: (NSMutableDictionary *) allDetail;

@end

@interface DetailListViewController : UITableViewController <DetailAddViewControllerDelegate> {

    BOOL isInEditing;
    NSUInteger selectedRow;
}

@property (nonatomic, strong) NSString *name;
@property NSString *selectedKey;
@property NSMutableDictionary *dictionary;
@property NSMutableDictionary *detailDictionary;
@property NSMutableArray *detailList;
@property NSMutableArray *detailNameList;
@property (nonatomic, weak) id <DetailListViewControllerDelegate> delegate;

- (IBAction)editDetail:(UIBarButtonItem *)sender;

@end
