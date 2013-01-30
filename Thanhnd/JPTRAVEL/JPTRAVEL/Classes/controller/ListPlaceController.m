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
#import "PlaceService.h"
@interface ListPlaceController (){
    NSMutableArray *lstPlaces;//Declar listPlaces
    PlaceService *placeService;//Declar Service
}

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
    //Initiation service
    placeService = [[PlaceService alloc]init];
    
    //assigin Delegate
    placeService.delegate = self;
    
    //Call method get data in service
    [placeService getListPlace:@"1" withOffset:1];
    
    //Assign method for selector when received data
    [placeService setDidFinishSelector:@selector(didFinishSelector:)];
    
    //Assign method for selector when not received data
    [placeService setDidFailedSelector:@selector(didFailSelector:)];
}

-(void)didFinishSelector:(BaseApiService *)response
{
    lstPlaces = response.arrayData;
    [tableViewPlaces reloadData];
}
-(void)didFailSelector:(BaseApiService *)response
{

}
@end