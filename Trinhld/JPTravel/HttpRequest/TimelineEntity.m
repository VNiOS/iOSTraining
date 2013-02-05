//
//  TimelineEntity.m
//  JPTravel
//
//  Created by Trinhld on 2/1/13.
//  Copyright (c) 2013 Trinhld. All rights reserved.
//

#import "TimelineEntity.h"

@implementation TimelineEntity

@synthesize itemType, user, event, post;

- (id) initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.user = [[UserEntity alloc] initWithDictionary:dict];
        self.itemType = [dict objectForKey:@"item_type"];
        if ([self.itemType isEqualToString:@"post"]) {
            self.post = [[PostEntity alloc] initWithDictionary:dict];
        }
        if ([self.itemType isEqualToString:@"event"]) {
            self.event = [[EventEntity alloc] initWithDictionary:dict];
        }
    }
    return self;
}

@end
