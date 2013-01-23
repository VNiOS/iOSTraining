//
//  TimelineControllerViewController.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/21/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "BaseViewController.h"

@interface TimelineControllerViewController : BaseViewController<UITableViewDataSource>
{
    
}
@property (nonatomic, retain) IBOutlet UITableView *tableViewTimeline;
@end
