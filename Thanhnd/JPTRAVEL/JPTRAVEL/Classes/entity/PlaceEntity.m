//
//  Place.m
//  JPTRAVEL
//
//  Created by Thanhnd on 1/18/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "PlaceEntity.h"

@implementation PlaceEntity
@synthesize placeId,urlImage,name;

-(id) initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    if (self) {
        
        if(dict){
            if([dict valueForKey:@"id"] != (id)[NSNull null]){
                self.placeId = [dict objectForKey:@"id"];
            }
            if([dict valueForKey:@"image_url"] != (id)[NSNull null] && [[dict valueForKey:@"image_url"] length] != 0){
                self.urlImage = [dict objectForKey:@"image_url"];
                NSLog(@"%@",urlImage);
            }
            if([dict valueForKey:@"name"] != (id)[NSNull null] && [[dict valueForKey:@"name"] length] != 0){
                self.name = [dict objectForKey:@"name"];
            }
        }
    }
    
    return self;
}
@end
