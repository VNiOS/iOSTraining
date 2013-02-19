//
//  PlaceService.m
//  JPTRAVEL
//
//  Created by Thanhnd on 1/25/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "PlaceService.h"
#import "PlaceEntity.h"
NSString * const SVPlace = @"places";
NSString * const SVAreaId = @"area_id";
@implementation PlaceService
-(void) getListPlace:(NSString *) areaId withOffset:(NSInteger) offset
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:areaId forKey:SVAreaId];
    [dict setValue:[NSString stringWithFormat:@"%d",offset] forKey:SVOffset];
    [dict setValue:[NSNumber numberWithInt:SVLimitValue] forKey:SVLimitKey];
    [self buildRequestGetGroup:SVPlace withParams:dict];
    [dict release];
}
-(void)buildData
{
    NSArray *arrPlaces = [self.dictData objectForKey:@"places"];
    arrayData = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in arrPlaces) {
        PlaceEntity *place = [[PlaceEntity alloc] initWithDictionary:dic];
        [self.arrayData addObject:place];
    }
    [super buildData];
}
@end
