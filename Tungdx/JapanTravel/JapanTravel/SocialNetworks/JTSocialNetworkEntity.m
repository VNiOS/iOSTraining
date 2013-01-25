//
//  JTSocialNetworkEntity.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/25/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "JTSocialNetworkEntity.h"

@implementation JTSocialNetworkEntity
@synthesize sid=_sid, accessToken=_accessToken;

- (id)initwithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if(self)
    {
        self.sid = [dic objectForKey:@"sid"];
        self.accessToken = [dic objectForKey:@"accessToken"];
    }
    return self;
}

- (void)dealloc
{
    [self.sid release];
    [self.accessToken release];
    [super dealloc];
}
@end
