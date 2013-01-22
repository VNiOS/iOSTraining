//
//  PlaceEntity.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/21/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "PlaceEntity.h"

@implementation PlaceEntity
@synthesize placeId=_placeId, placeName=_placeName, imageUrl=_imageUrl;
- (id)initwithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if(self)
    {
        self.placeId = [dic objectForKey:@"id"];
        self.placeName = [dic objectForKey:@"name"];
        self.imageUrl = [dic objectForKey:@"image_url"];
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
    [self.placeId release];
    self.placeId = nil;
    [self.placeName release];
    self.placeName = nil;
    [self.imageUrl release];
    self.imageUrl = nil;
}

@end
