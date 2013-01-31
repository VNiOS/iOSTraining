//
//  TimelineController.m
//  JPTRAVEL
//
//  Created by Thanhnd on 1/21/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "TimelineController.h"
#import "PostCell.h"
#import "TimelineEntity.h"
#import "EventCustomCell.h"
#import <CKRefreshControl/CKRefreshControl.h>
#import "TimelineService.h"

@interface TimelineController (){
    NSMutableArray *listTimeline;
}
@end

@interface TimelineController (UITableViewDelegate) <UITableViewDelegate>

@end

@implementation TimelineController
@synthesize tableViewTimeline;
@synthesize timelineService;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    #pragma init tableview
    tableViewTimeline = [[[UITableView alloc] initWithFrame:CGRectMake(0, 20, 320, 460) style:UITableViewStylePlain] autorelease];
    tableViewTimeline.dataSource = self;
    tableViewTimeline.delegate = self;
    [self.view addSubview:tableViewTimeline];
    
    #pragma mark - Pull to refresh init
    CKRefreshControl *refreshControl = [CKRefreshControl new];
    [refreshControl addTarget:self action:@selector(doRefresh:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = (id)refreshControl;
    [tableViewTimeline addSubview:refreshControl];
    
    timelineService = [[TimelineService alloc] init];
    timelineService.delegate = self;
    [timelineService getListTimeline:1];
    [timelineService setDidFinishSelector:@selector(didFinishSelector:)];
}

- (void)doRefresh:(CKRefreshControl *)sender {
   [timelineService getListTimeline:1];
}

- (void) didFinishSelector:(TimelineService *) respones
{
    listTimeline = respones.arrayData;
    [tableViewTimeline reloadData];
    [self.refreshControl performSelector:@selector(endRefreshing)];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) dealloc
{
    [listTimeline release];
    [timelineService release];
    [tableViewTimeline release];
    [super dealloc];
}
@end

@implementation TimelineController (UITableViewDelegate)
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{   
    TimelineEntity *timelineEntity = [listTimeline objectAtIndex:indexPath.row];
    if(timelineEntity && [timelineEntity.itemType isEqualToString:@"post"])
    {
        static NSString *keyPostId = @"postItem";
        PostCell *cellPost = [tableViewTimeline dequeueReusableCellWithIdentifier:keyPostId];
        if (cellPost == nil) {
            cellPost = [[[PostCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:keyPostId] autorelease];
        }
        [cellPost updateContent:timelineEntity];
        return cellPost;
    }
    
    if (timelineEntity && [timelineEntity.itemType isEqualToString:@"event"]) {
        static NSString *keyEventId = @"eventItem";
        EventCustomCell *cellEvent = [tableViewTimeline dequeueReusableCellWithIdentifier:keyEventId];
        if (cellEvent == nil) {
            cellEvent = [[[EventCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:keyEventId] autorelease];
        }
        [cellEvent updateContent:timelineEntity];
        return cellEvent;
    }
    return nil;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (listTimeline) {
        return [listTimeline count];
    }else{
        return 0;
    }
        
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end

