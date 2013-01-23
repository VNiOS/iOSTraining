//
//  JTTimeLineViewController.h
//  JapanTravel
//
//  Created by Xuan Tung on 1/22/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBJson.h"
#import "RootViewController.h"

@class ASIHTTPRequest;

@interface JTTimeLineViewController : RootViewController <SBJsonStreamParserAdapterDelegate,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    int offset;
    ASIHTTPRequest *requestTimeline;
    
    NSMutableArray *listTimeline;
}
@end
