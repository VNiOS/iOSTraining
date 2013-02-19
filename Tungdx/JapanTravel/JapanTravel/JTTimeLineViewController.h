//
//  JTTimeLineViewController.h
//  JapanTravel
//
//  Created by Xuan Tung on 1/22/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBJson.h"
#import "PullToRefreshTableViewController.h"
#import "JTTimelineCell.h"
@class ASIHTTPRequest;

@interface JTTimeLineViewController : PullToRefreshTableViewController <SBJsonStreamParserAdapterDelegate,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    int offset;
    ASIHTTPRequest *requestTimeline;
    
    NSMutableArray *_listTimeline;
    BOOL hasmore;
    BOOL isRefresh;
}

@property (nonatomic, retain) NSMutableArray *listTimeline;
@end
