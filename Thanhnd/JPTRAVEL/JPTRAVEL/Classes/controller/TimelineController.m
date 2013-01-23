//
//  TimelineController.m
//  JPTRAVEL
//
//  Created by Thanhnd on 1/21/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "TimelineController.h"
#import "ASIHTTPRequest.h"
#import <SBJson/SBJson.h>
#import <SBJson/SBJsonStreamParserAdapter.h>
#import <SBJson/SBJsonStreamParser.h>
#import "JsonParser.h"
#import <UIImageView+WebCache.h>
#import "PostCell.h"
#import "TimelineEntity.h"
#import "EventCustomCell.h"
#import <CKRefreshControl/CKRefreshControl.h>

@interface TimelineController (){
    ASIHTTPRequest *requestData;
    SBJsonStreamParserAdapter *jsonAdapter;
    SBJsonStreamParser *parser;
    NSMutableArray *lstTimeline;
}

@end

@interface TimelineController (SBJsonStreamParserAdapterDelegate) <SBJsonStreamParserAdapterDelegate>

@end
@interface TimelineController (UITableViewDelegate) <UITableViewDelegate>

@end
@implementation TimelineController
@synthesize tableViewTimeline;


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
    #pragma mark - JSON init
    jsonAdapter = [[SBJsonStreamParserAdapter alloc] init];
    jsonAdapter.delegate = self;
    parser = [[SBJsonStreamParser alloc] init];
    parser.delegate = jsonAdapter;
    parser.supportMultipleDocuments = YES;
    
    #pragma mark - Pull to refresh init
    CKRefreshControl *refreshControl = [CKRefreshControl new];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"AloAlo"];
    [refreshControl addTarget:self action:@selector(doRefresh:) forControlEvents:UIControlEventValueChanged];
    
    #pragma mark - Request init
    requestData = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:@"http://api.japantravel.icapps.co/timeline?limit=20&offset=1"]];
    requestData.delegate = self;
    [requestData setDidFinishSelector:@selector(didFinishSelector:)];
    [requestData startAsynchronous];

}

- (void) didFinishSelector:(ASIHTTPRequest *) respones
{
    NSData* data = [respones responseData];
    [parser parse:data];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) dealloc
{
    [lstTimeline release];
    [requestData release];
    [jsonAdapter release];
    [parser release];
    [super dealloc];
}
@end

@implementation TimelineController (SBJsonStreamParserAdapterDelegate)

- (void)parser:(SBJsonStreamParser*)parser foundArray:(NSArray*)array
{
    NSLog(@"Dict: %@",array);
}

- (void)parser:(SBJsonStreamParser*)parser foundObject:(NSDictionary*)dict
{
    JsonParser *jsParser = [[JsonParser alloc] init];
    lstTimeline = [[jsParser getListTimeline:dict] retain];
    [tableViewTimeline reloadData];
    NSLog(@"Dict: %@",dict);
}

@end

@implementation TimelineController (UITableViewDelegate)
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{   
    TimelineEntity *timelineEntity = [lstTimeline objectAtIndex:indexPath.row];
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
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (lstTimeline) {
        return [lstTimeline count];
    }else{
        return 0;
    }
        
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

@end
