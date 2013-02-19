//
//  JTViewController.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/21/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "JTViewController.h"
#import "ASIHTTPRequest.h"
#import "SBJson.h"
#import "JTPlaceCell.h"
#import "PlaceEntity.h"
#import "JTImageView.h"
#import "UIImageView+WebCache.h"

@interface JTViewController ()<SBJsonStreamParserAdapterDelegate>

@end
@implementation JTViewController
@synthesize tableview=_tableview, listPlace=_listPlace;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [_tableview setDataSource:self];
    [_tableview setDelegate:self];
    [self.view addSubview:_tableview];
    [self getListPlace];
}

- (void)getListPlace
{
    adapter = [[SBJsonStreamParserAdapter alloc]init];
    adapter.delegate = self;

    paser = [[SBJsonStreamParser alloc] init];
    paser.delegate = adapter;
    
    ASIHTTPRequest *request = [[ASIHTTPRequest alloc]initWithURL:[NSURL URLWithString:@"http://api.japantravel.icapps.co/places?area_id=1&limit=20&offset=1"]];
    [request setDelegate:self];
    [request setDidFailSelector:@selector(getListPlaceFailed:)];
    [request setDidFinishSelector:@selector(getListPlaceFinished:)];
    [request startAsynchronous];
}

- (void)getListPlaceFinished:(ASIHTTPRequest *)request
{
    [paser parse:request.responseData];
}

- (void)parser:(SBJsonStreamParser *)parser foundObject:(NSDictionary *)dict
{
    NSMutableArray *places = [[dict objectForKey:@"data"] objectForKey:@"places"];
    if(!self.listPlace)
        self.listPlace = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dict in places) {
        PlaceEntity *place = [[PlaceEntity alloc] initwithDictionary:dict];
        [self.listPlace addObject:place];
        [place release];
    }
    [self.tableview reloadData];
}

- (void)parser:(SBJsonStreamParser *)parser foundArray:(NSArray *)array
{
    
}

- (void)getListPlaceFailed:(ASIHTTPRequest *)request
{
    NSLog(@" get fail");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - tableview delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"placeCell";
    JTPlaceCell *cell;
    cell = (JTPlaceCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell)
    {
        cell = [[JTPlaceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    PlaceEntity *place = [self.listPlace objectAtIndex:indexPath.row];
    [cell.placeName setText:place.placeName];
    [cell.placeName setTag:0];
    [cell.placeImage loadImageFromUrl:[NSURL URLWithString:place.imageUrl]];
    [cell.placeImage setPhotoId:place.placeId];
    [cell.placeImage setTag:1];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_listPlace count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
@end
