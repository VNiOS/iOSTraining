//
//  Place.m
//  JPTRAVEL
//
//  Created by Thanhnd on 1/18/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "PlaceEntity.h"

@implementation PlaceEntity
@synthesize placeId;
@synthesize name;
@synthesize urlImage;

-(id) initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        if(dict){
            self.placeId = [dict valueForKeyPath:@"id"];
            self.urlImage = [dict valueForKeyPath:@"image_url"];
            self.name = [dict valueForKeyPath:@"name"];
        }
    }
    return self;
}
@end
