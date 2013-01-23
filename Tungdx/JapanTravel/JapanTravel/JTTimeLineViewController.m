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

@interface JTTimeLineViewController ()

@end

@implementation JTTimeLineViewController

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
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView setSeparatorStyle:UITableViewCellSelectionStyleGray];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    offset = 1;
    [self requestTimeline];
	// Do any additional setup after loading the view.
}

- (void)requestTimeline
{
    NSString *urlString = [NSString stringWithFormat:@"%@%d",@"http://api.japantravel.icapps.co/timeline?limit=20&offset=",offset];
    NSURL *url = [NSURL URLWithString:urlString];
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
        if([dict objectForKey:@"data"] != [NSNull class])
        {
            if(!listTimeline)
                listTimeline = [[NSMutableArray alloc] init];
            NSMutableArray *timelines = [[dict objectForKey:@"data"] objectForKey:@"timeline"];
            for (NSDictionary *timeline in timelines ) {
                if([[timeline objectForKey:@"item_type"] isEqualToString:@"post"])
                {
                    PostingEntity *entity = [[PostingEntity alloc] initwithDictionary:timeline];
                    [listTimeline addObject:entity];
                    [entity release];
                }
                else if([[timeline objectForKey:@"item_type"] isEqualToString:@"event"])
                {
                    EventEntity *entity = [[EventEntity alloc] initwithDictionary:timeline];
                    [listTimeline addObject:entity];
                    [entity release];
                }
            }
        }
    }
    [self.tableView reloadData];
}

- (void)parser:(SBJsonStreamParser *)parser foundArray:(NSArray *)array
{
    NSLog(@"array");
}

- (void)getTimelineFailed:(ASIHTTPRequest *)request
{
    NSLog(@"failed");
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
    return [listTimeline count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([[listTimeline objectAtIndex:indexPath.row] isKindOfClass:[PostingEntity class]])
    {
        PostingEntity *entity = (PostingEntity *)[listTimeline objectAtIndex:indexPath.row];
        return 10 + 20 +10 +[JTCommonUltils contentSizewithText:entity.description andConstrainedSize:CGSizeMake(150, 1000) andFontSize:14].height + 10 +20+20+10;
    }
    else
    {
        EventEntity *entity = (EventEntity *)[listTimeline objectAtIndex:indexPath.row];
        return 10 + 20 +[JTCommonUltils contentSizewithText:entity.eventDescription andConstrainedSize:CGSizeMake(200, 1000) andFontSize:14].height + 10;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"timelineCell";
    JTTimelineCell *cell;
    cell = (JTTimelineCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell)
    {
        cell = [[JTTimelineCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSObject *entity = [listTimeline objectAtIndex:indexPath.row];
    [cell fillDataCellfromObject:entity];
    
    return cell;
}

@end
