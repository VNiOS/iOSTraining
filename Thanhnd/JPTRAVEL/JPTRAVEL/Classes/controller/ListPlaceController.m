//
//  ListPlaceController.m
//  JPTRAVEL
//
//  Created by Thanhnd on 1/17/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "ListPlaceController.h"
#import "ASIHTTPRequest.h"
#import <SBJson/SBJson.h>
#import <SBJson/SBJsonStreamParserAdapter.h>
#import <SBJson/SBJsonStreamParser.h>
#import "JsonParser.h"
#import "PlaceEntity.h"
#import <UIImageView+WebCache.h>

@interface ListPlaceController (){
    ASIHTTPRequest *requestData;
    SBJsonStreamParserAdapter *jsonAdapter;
    SBJsonStreamParser *parser;
    NSMutableArray *lstPlaces;
}

@end

@interface ListPlaceController (SBJsonStreamParserAdapterDelegate) <SBJsonStreamParserAdapterDelegate>

@end

@implementation ListPlaceController
@synthesize tableViewPlaces;

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
    // Do any additional setup after loading the view from its nib.
    jsonAdapter = [[SBJsonStreamParserAdapter alloc] init];
    
    jsonAdapter.delegate = self;
    
    parser = [[SBJsonStreamParser alloc] init];
    
    parser.delegate = jsonAdapter;

    parser.supportMultipleDocuments = YES;
    
    requestData = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:@"http://api.japantravel.icapps.co/places?area_id=1&limit=20&offset=1"]];
    requestData.delegate = self;
    [requestData setDidFinishSelector:@selector(didFinishSelector:)];
    [requestData startAsynchronous];
    
}
- (void) didFinishSelector:(ASIHTTPRequest *) respones
{
    NSData* data = [respones responseData];
    [parser parse:data];
    
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(lstPlaces) return [lstPlaces count];
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *keyTableId = @"placeItem";
    UITableViewCell *cell = [tableViewPlaces dequeueReusableCellWithIdentifier:keyTableId];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:keyTableId] autorelease];
    }
    PlaceEntity *place = [lstPlaces objectAtIndex:indexPath.row];
    cell.textLabel.text = place.name;
    [cell.imageView setImageWithURL:[NSURL URLWithString:place.urlImage] placeholderImage:[UIImage imageNamed:@"icon.png"]];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) dealloc
{
    [lstPlaces release];
    [requestData release];
    [jsonAdapter release];
    [parser release];
    [super dealloc];
}

@end

@implementation ListPlaceController (SBJsonStreamParserAdapterDelegate)

- (void)parser:(SBJsonStreamParser*)parser foundArray:(NSArray*)array
{
    NSLog(@"Dict: %@",array);
}

- (void)parser:(SBJsonStreamParser*)parser foundObject:(NSDictionary*)dict
{
    JsonParser *jsParser = [[JsonParser alloc] init];
    lstPlaces = [[jsParser getListPlace:dict] retain];
    [tableViewPlaces reloadData];
    NSLog(@"Dict: %@",dict);
}

@end
