//
//  TimelineControllerViewController.m
//  JPTRAVEL
//
//  Created by Thanhnd on 1/21/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "TimelineControllerViewController.h"
#import "ASIHTTPRequest.h"
#import <SBJson/SBJson.h>
#import <SBJson/SBJsonStreamParserAdapter.h>
#import <SBJson/SBJsonStreamParser.h>
#import "JsonParser.h"
#import <UIImageView+WebCache.h>
#import "PostCell.h"
#import "TimelineEntity.h"
@interface TimelineControllerViewController (){
    ASIHTTPRequest *requestData;
    SBJsonStreamParserAdapter *jsonAdapter;
    SBJsonStreamParser *parser;
    NSMutableArray *lstTimeline;
}

@end

@interface TimelineControllerViewController (SBJsonStreamParserAdapterDelegate) <SBJsonStreamParserAdapterDelegate>

@end
@interface TimelineControllerViewController (UITableViewDelegate) <UITableViewDelegate>

@end
@implementation TimelineControllerViewController
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
	// Do any additional setup after loading the view.
    
    jsonAdapter = [[SBJsonStreamParserAdapter alloc] init];
    
    jsonAdapter.delegate = self;
    
    parser = [[SBJsonStreamParser alloc] init];
    
    parser.delegate = jsonAdapter;
    
    parser.supportMultipleDocuments = YES;
    
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

@implementation TimelineControllerViewController (SBJsonStreamParserAdapterDelegate)

- (void)parser:(SBJsonStreamParser*)parser foundArray:(NSArray*)array
{
    NSLog(@"Dict: %@",array);
}

- (void)parser:(SBJsonStreamParser*)parser foundObject:(NSDictionary*)dict
{
    JsonParser *jsParser = [[JsonParser alloc] init];
    lstTimeline = [[jsParser getListTimeline:dict] retain];
    [tableViewTimeline reloadData];
   // NSLog(@"count: %d",[lstTimeline count]);
}

@end

@implementation TimelineControllerViewController (UITableViewDelegate)
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *keyPostId = @"postItem";
    PostCell *cell = [tableViewTimeline dequeueReusableCellWithIdentifier:keyPostId];
    if (cell == nil) {
        cell = [[[PostCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:keyPostId] autorelease];
    }
    TimelineEntity *timelineEntity = [lstTimeline objectAtIndex:indexPath.row];
    if(timelineEntity && [timelineEntity.itemType isEqualToString:@"post"])
    {
        [cell updateContent:timelineEntity];
    }
    return cell;
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
    return 100;
}

@end
