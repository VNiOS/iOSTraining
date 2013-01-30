//
//  TimelineService.m
//  JPTRAVEL
//
//  Created by Thanhnd on 1/22/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "TimelineService.h"
#import "TimelineEntity.h"
NSString * const SVTimeline = @"timeline";

@implementation TimelineService
-(void) getListTimeline:(int)offset{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[NSNumber numberWithInt:offset] forKey:SVOffset];
    [dict setValue:[NSNumber numberWithInt:SVLimitValue] forKey:SVLimitKey];
    [self buildRequestGetGroup:SVTimeline withParams:dict];
    [dict release];
}


-(void) buildData{
    NSArray *arrPlaces = [self.dictData objectForKey:@"timeline"];
    arrayData = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in arrPlaces) {
        TimelineEntity *timeline = [[TimelineEntity alloc] initWithDictionary:dic];
        [arrayData addObject:timeline];
    }
    [super buildData];
}
@end
