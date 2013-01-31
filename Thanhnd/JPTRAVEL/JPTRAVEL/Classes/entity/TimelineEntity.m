//
//  PostEntity.m
//  JPTRAVEL
//
//  Created by Thanhnd on 1/21/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "TimelineEntity.h"
#import "AFSupportAPIClient.h"
#import "TimelineService.h"
@implementation TimelineEntity
@synthesize itemType,user,post,event;
-(id) initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    if (self) {
        if(dict){
            self.itemType = [dict valueForKeyPath:@"item_type"];
            if(itemType && [itemType isEqualToString:@"post"]){
                self.post = [[PostEntity alloc] initWithDictionary:dict];
            }
            if(itemType && [itemType isEqualToString:@"event"]){
                self.event = [[EventEntity alloc] initWithDictionary:dict];
            }
            self.user = [[UserEntity alloc] initWithDictionary:dict];
        }
    }
    return self;
}
@end
