//
//  ALTableViewController.h
//  JPTRAVEL
//
//  Created by Thanhnd on 2/18/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CKRefreshControl/CKRefreshControl.h>
#define DEBUG 0
@interface ALTableViewController : UITableViewController


@property (nonatomic,retain) UIRefreshControl *refreshControl;
@property (nonatomic) BOOL enableRefreshHeader;
@property (nonatomic) BOOL enableLoadMore;

- (void)doRefresh:(CKRefreshControl *)sender;
- (void) endRefresh;
@property (nonatomic, assign) NSInteger *lastNumberItem;
@end
