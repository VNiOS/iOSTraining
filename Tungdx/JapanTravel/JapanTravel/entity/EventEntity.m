//
//  EventEntity.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/22/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "EventEntity.h"
#import "JTCommonUltils.h"
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
        self.imageUrl = [dict objectForKey:@"image"];
        self.startTime = [dict objectForKey:@"start_at"];
        self.endTime = [dict objectForKey:@"end_at"];
    }
    return self;
}

- (void)dealloc
{

    [self.eventId release];
    [self.eventName release];
    [self.eventDescription release];
    [self.startTime release];
    [self.endTime release];
    
    [super dealloc];
}
@end
