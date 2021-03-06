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
            if([dict valueForKey:@"image"] != (id)[NSNull null] && [[dict valueForKey:@"image"] length] != 0){
                self.imageUrl = [dict objectForKey:@"image"];
            }
            if([dict valueForKey:@"name"] != (id)[NSNull null] && [[dict valueForKey:@"name"] length] != 0){
                self.name = [dict objectForKey:@"name"];
            }
            if([dict valueForKey:@"start_at"] != (id)[NSNull null] && [[dict valueForKey:@"start_at"] length] != 0){
                self.startTime = [Util formatDateWithString:[dict objectForKey:@"start_at"]];
            }
            if([dict valueForKey:@"end_at"] != (id)[NSNull null] && [[dict valueForKey:@"end_at"] length] != 0){
                self.endTime = [Util formatDateWithString:[dict objectForKey:@"end_at"]];
            }
            
        }
    }
    
    return self;
}

@end
