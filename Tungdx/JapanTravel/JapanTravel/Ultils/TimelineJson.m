//
//  TimelineJson.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/24/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "TimelineJson.h"

@implementation TimelineJson


- (id)init
{
    self = [super init];
    if(self)
    {
        
    }
    return self;
}

- (void)JsonRequestTimelineFromData:(NSData *)data
{
    [self setTag:1];
    [self parseJson:data];
}

- (void)parserDataSuccess:(NSDictionary *)dict withTag:(int)tags
{
    if(tags==1)
    {
        
    }
}

- (void)returnDelegate:(NSObject *)object
{
    
}
@end
