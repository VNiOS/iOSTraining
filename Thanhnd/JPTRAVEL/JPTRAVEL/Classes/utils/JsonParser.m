//
//  JsonParser.m
//  JPTRAVEL
//
//  Created by Thanhnd on 1/18/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "JsonParser.h"
#import "PlaceEntity.h"
#import "TimelineEntity.h"
@implementation JsonParser
- (NSMutableArray *) getListPlace:(NSDictionary *) dict
{
    NSMutableArray *array = [[[NSMutableArray alloc] init] autorelease];
    
    NSString *status = [dict objectForKey:@"status"];
    if ([status isEqualToString:@"success"]) {
        NSDictionary *dicData = [dict objectForKey:@"data"];
        if (dicData != nil) {
            NSArray *arrPlaces = [dicData objectForKey:@"places"];
            for (NSDictionary *dic in arrPlaces) {
                PlaceEntity *place = [[PlaceEntity alloc] initWithDictionary:dic];
                [array addObject:place];
            }
        }
    }
    return array;
}

- (NSMutableArray *) getListTimeline:(NSDictionary *)dict
{
    NSMutableArray *array = [[[NSMutableArray alloc] init] autorelease];
    
    NSString *status = [dict objectForKey:@"status"];
    if ([status isEqualToString:@"success"]) {
        NSDictionary *dicData = [dict objectForKey:@"data"];
        if (dicData != nil) {
            NSArray *arrPlaces = [dicData objectForKey:@"timeline"];
            for (NSDictionary *dic in arrPlaces) {
                TimelineEntity *timeline = [[TimelineEntity alloc] initWithDictionary:dic];
                [array addObject:timeline];
            }
        }
    }
    return array;
}
@end
