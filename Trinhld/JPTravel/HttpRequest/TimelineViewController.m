//
//  TimelineViewController.m
//  JPTravel
//
//  Created by Trinhld on 1/31/13.
//  Copyright (c) 2013 Trinhld. All rights reserved.
//

#import "TimelineViewController.h"
#import "BaseApiRequest.h"
#import "TimelineEntity.h"
#import "TimelinePostViewCell.h"
#import "TimelineEventViewCell.h"
#import "EGORefreshTableHeaderView.h"

@interface TimelineViewController ()
{
    BaseApiRequest *apiRequest;
    NSMutableArray *timelineList;
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL _reloading;
}
@end

@interface TimelineViewController (APIRequestDelegate) <APIRequestDelegate>

@end


@interface TimelineViewController (EGORefreshTableDelegate) <EGORefreshTableHeaderDelegate>


@end


@implementation TimelineViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (_refreshHeaderView == nil) {
        EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.view.frame.size.width, self.tableView.bounds.size.height)];
		view.delegate = self;
		[self.tableView addSubview:view];
		_refreshHeaderView = view;
        [self getTimeline];
    }
    [_refreshHeaderView refreshLastUpdatedDate];
}

- (void)getTimeline
{
    NSMutableDictionary *timelineParams = [[NSMutableDictionary alloc] init];
    int limitParam = 20;
    int offsetParam = 1;
    [timelineParams setValue:[NSNumber numberWithInt:limitParam] forKey:@"limit"];
    [timelineParams setValue:[NSNumber numberWithInt:offsetParam] forKey:@"offset"];
    apiRequest = [[BaseApiRequest alloc] init];
    [apiRequest setDelegate:self];
    [apiRequest buildRequest:@"timeline" params:timelineParams];
}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadTableViewDataSource{
	
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
    [self getTimeline];
	_reloading = YES;
	
}

- (void)doneLoadingTableViewData{
	
	//  model should call this when its done loading
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
	
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	
	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
	
}

#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	
	[self reloadTableViewDataSource];
//	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
	
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	
	return _reloading; // should return if data source model is reloading
	
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [timelineList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifierEvent = @"cellEvent";
    static NSString *CellIdentifierPost = @"cellPost";

    TimelineEntity *timeline = [timelineList objectAtIndex:indexPath.row];
    if ([timeline.itemType isEqualToString:@"event"]) {
        TimelineEventViewCell *cellEvent = [tableView dequeueReusableCellWithIdentifier:CellIdentifierEvent];
        if (cellEvent == nil) {
            cellEvent = [[TimelineEventViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifierEvent];
        }
        [cellEvent updateCell:timeline];
        return cellEvent;
    }
    if ([timeline.itemType isEqualToString:@"post"]) {
        TimelinePostViewCell *cellPost = [tableView dequeueReusableCellWithIdentifier:CellIdentifierPost];
        if (cellPost == nil) {
            cellPost = [[TimelinePostViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifierPost];
        }
        [cellPost updateCell:timeline];
        return cellPost;
    }
    
    return nil;
}

@end

@implementation TimelineViewController (APIRequestDelegate)

- (void)didReceiveData:(NSDictionary *)dict
{
    timelineList = [[NSMutableArray alloc] init];
    NSArray *tempArray = [dict objectForKey:@"timeline"];
    [timelineList removeAllObjects];
    for (NSDictionary *tempDict in tempArray) {
        TimelineEntity *timeline = [[TimelineEntity alloc] initWithDictionary:tempDict];
        [timelineList addObject:timeline];
    }
    [self.tableView reloadData];
    [self doneLoadingTableViewData];
}

@end
