//
//  EventEntity.m
//  JPTRAVEL
//
//  Created by Thanhnd on 1/21/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "EventEntity.h"

@implementation EventEntity
@synthesize endTime,eventId,imageUrl,name,startTime,description;

-(id) initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    if (self) {
        
        if(dict){
            if([dict valueForKey:@"id"] != (id)[NSNull null]){
                self.eventId = [dict objectForKey:@"id"];
            }
            if([dict valueForKey:@"description"] != (id)[NSNull null] && [[dict valueForKey:@"description"] length] != 0){
                self.description = [dict objectForKey:@"description"];
            }
            if([dict valueForKey:@"image_url"] != (id)[NSNull null] && [[dict valueForKey:@"image_url"] length] != 0){
                self.imageUrl = [dict objectForKey:@"image_url"];
            }
            if([dict valueForKey:@"name"] != (id)[NSNull null] && [[dict valueForKey:@"name"] length] != 0){
                self.name = [dict objectForKey:@"name"];
            }
            if([dict valueForKey:@"start_time"] != (id)[NSNull null] && [[dict valueForKey:@"start_time"] length] != 0){
                self.startTime = [dict objectForKey:@"start_time"];
            }
            if([dict valueForKey:@"end_time"] != (id)[NSNull null] && [[dict valueForKey:@"end_time"] length] != 0){
                self.endTime = [dict objectForKey:@"end_time"];
            }
            
        }
    }
    
    return self;
}

@end
