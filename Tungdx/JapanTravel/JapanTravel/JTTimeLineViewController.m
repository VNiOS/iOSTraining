//
//  JTTimeLineViewController.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/22/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "JTTimeLineViewController.h"
#import "ASIHTTPRequest.h"
#import "JTTimelineCell.h"
#import "JTImageView.h"
#import "JTJsonUltils.h"
#import "PostingEntity.h"
#import "EventEntity.h"
#import "JTCommonUltils.h"
#import "JTLoadMoreCell.h"


@interface JTTimeLineViewController ()

@end

@implementation JTTimeLineViewController
@synthesize listTimeline=_listTimeline;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if(self)
    {
        self.listTimeline = [[NSMutableArray alloc] init];
        self.reloading = NO;
        hasmore = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    offset = 0;
    [self requestTimeline];
	// Do any additional setup after loading the view.
}

- (void)requestTimeline
{
    if(offset<1)
        offset = 1;
    NSString *urlString = [NSString stringWithFormat:@"%@%d",@"http://api.japantravel.icapps.co/timeline?limit=20&offset=",offset];
    NSLog(@"url: %@",urlString);
    NSURL *url = [NSURL URLWithString:urlString];
    if(requestTimeline && ![requestTimeline complete])
    {
        [requestTimeline clearDelegatesAndCancel];
        [requestTimeline release];
        requestTimeline = nil;
    }
    requestTimeline = [[ASIHTTPRequest alloc] initWithURL:url];
    requestTimeline.delegate = self;
    [requestTimeline setDidFailSelector:@selector(getTimelineFailed:)];
    [requestTimeline setDidFinishSelector:@selector(getTimeLineFinished:)];
    [requestTimeline startAsynchronous];
}

- (void)getTimeLineFinished:(ASIHTTPRequest *)request
{
    NSLog(@"finished");
    JTJsonUltils *json = [[JTJsonUltils alloc] initWithDelegate:self];
    [json parseJson:[request responseData]];
}

- (void)parser:(SBJsonStreamParser *)parser foundObject:(NSDictionary *)dict
{
    
    NSString *success = [dict objectForKey:@"status"];
    if([success isEqualToString:@"success"])
    {
        if(![[dict objectForKey:@"data"] isKindOfClass:[NSNull class]]) 
        {
            NSMutableArray *temp = [[NSMutableArray alloc] init];
            NSMutableArray *timelines = [[dict objectForKey:@"data"] objectForKey:@"timeline"];
            for (NSDictionary *timeline in timelines ) {
                if([[timeline objectForKey:@"item_type"] isEqualToString:@"post"])
                {
                    PostingEntity *entity = [[PostingEntity alloc] initwithDictionary:timeline];
                    [temp addObject:entity];
                    [entity release];
                }
                else if([[timeline objectForKey:@"item_type"] isEqualToString:@"event"])
                {
                    EventEntity *entity = [[EventEntity alloc] initwithDictionary:timeline];
                    [temp addObject:entity];
                    [entity release];
                }
            }
            if(self.reloading)
            {
                [self.listTimeline removeAllObjects];
            }
            [self.listTimeline addObjectsFromArray:temp];
            [temp release];
            temp = nil;
        }
        else
        {
            hasmore = NO;
        }
    }
    if(self.reloading)
        [self dataSourceDidFinishLoadingNewData];
    [self.tableView reloadData];
}

- (void)parser:(SBJsonStreamParser *)parser foundArray:(NSArray *)array
{
    NSLog(@"array");
}

- (void)getTimelineFailed:(ASIHTTPRequest *)request
{
    NSLog(@"failed");
    if(self.reloading)
        [self dataSourceDidFinishLoadingNewData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listTimeline count]+1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row<self.listTimeline.count)
    {
        return [JTTimelineCell cellHeight:[self.listTimeline objectAtIndex:indexPath.row]];
    }
    else
    {
        if (hasmore)
            return 60;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if(indexPath.row<self.listTimeline.count)
    {
        static NSString *cellIdentifier = @"timelineCell";
        JTTimelineCell *cell;
        cell = (JTTimelineCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if(!cell)
        {
            cell = [[JTTimelineCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        NSObject *entity = [self.listTimeline objectAtIndex:indexPath.row];
        [cell fillDataCellfromObject:entity];
        return cell;
    }
    else
    {
        UITableViewCell *cell;
        if(self.listTimeline.count>0 && hasmore && !self.reloading)
        {
            static NSString *CellIdentifier = @"ShowMoreNewCell";
            JTLoadMoreCell *cellMore;
            cellMore = [[[JTLoadMoreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: CellIdentifier] autorelease];
            
            [self performSelector:@selector(loadmore)];
            return cellMore;
        }
        else
        {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"nil"] autorelease];
        }
        return cell;
    }
    return nil;
}

- (void) reloadTableViewDataSource
{
    offset = 0;
    hasmore = YES;
    [self requestTimeline];
}


- (void)loadmore
{
    offset += 1;
    [self requestTimeline];
}

@end
