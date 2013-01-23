//
//  EventEntity.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/22/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "EventEntity.h"

@implementation EventEntity
@synthesize eventId=_eventId, eventName=_eventName, eventDescription=_eventDescription, imageUrl=_imageUrl, startTime=_startTime, endTime=_endTime;

- (id)initwithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if(self)
    {
        self.eventId = [dict objectForKey:@"id"];
        self.eventName = [dict objectForKey:@"name"];
        self.eventDescription = [dict objectForKey:@"description"];
        self.imageUrl = [dict objectForKey:@"image_url"];
        self.startTime = [dict objectForKey:@"start_time"];
        self.endTime = [dict objectForKey:@"end_time"];
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
    [self.eventId release];
    self.eventId = nil;
    [self.eventName release];
    self.eventName = nil;
    [self.eventDescription release];
    self.eventDescription = nil;
    [self.startTime release];
    self.startTime = nil;
    [self.endTime release];
    self.endTime = nil;
}
@end
