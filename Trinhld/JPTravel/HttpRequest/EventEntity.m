//
//  EventEntity.m
//  JPTravel
//
//  Created by Trinhld on 1/31/13.
//  Copyright (c) 2013 Trinhld. All rights reserved.
//

#import "EventEntity.h"

@implementation EventEntity

@synthesize name, description, imageUrl, startTime, endTime;

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.name = ([dict objectForKey:@"name"] != [NSNull null]) ? [dict objectForKey:@"name"] : nil;
        self.description = ([dict objectForKey:@"description"] != [NSNull null]) ? [dict objectForKey:@"description"] : nil;
        self.imageUrl = ([dict objectForKey:@"image"] != [NSNull null]) ? [dict objectForKey:@"image"] : nil;
        self.startTime = ([dict objectForKey:@"start_at"] != [NSNull null]) ? [dict objectForKey:@"start_at"] : nil;
        self.endTime = ([dict objectForKey:@"end_at"] != [NSNull null]) ? [dict objectForKey:@"end_at"] : nil;
    }
    return self;
}

@end
