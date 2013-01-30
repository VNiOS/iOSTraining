//
//  TimelineController.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/21/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "BaseViewController.h"
#import "TimelineService.h"
@interface TimelineController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property (nonatomic, retain) UITableView *tableViewTimeline;
@property (nonatomic,retain) TimelineService *timelineService;
@property (nonatomic,retain) UIRefreshControl *refreshControl;
@property(nonatomic) BOOL clearsSelectionOnViewWillAppear;
@end
