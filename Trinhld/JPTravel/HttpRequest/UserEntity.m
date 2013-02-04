//
//  UserEntity.m
//  JPTravel
//
//  Created by Trinhld on 1/31/13.
//  Copyright (c) 2013 Trinhld. All rights reserved.
//

#import "UserEntity.h"

@implementation UserEntity

@synthesize userId, userName, userAvatar;

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self && dict) {
        self.userId = ([dict objectForKey:@"id"] != [NSNull null]) ? [dict objectForKey:@"id"] : nil;
        self.userName = ([dict objectForKey:@"user_name"] != [NSNull null]) ? [dict objectForKey:@"user_name"] : nil;
        self.userAvatar = ([dict objectForKey:@"user_avatar"] != [NSNull null]) ? [ dict objectForKey:@"user_avatar"] : nil;
    }
    return self;
}

@end
