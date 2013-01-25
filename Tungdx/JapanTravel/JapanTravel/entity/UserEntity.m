//
//  UserEntity.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/24/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "UserEntity.h"

@implementation UserEntity

- (id)initwithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if(self)
    {
        self.userId = [dic objectForKey:@"id"];
        self.username = [dic objectForKey:@"name"];
        self.facebookId = [dic objectForKey:@"facebook_id"];
        self.facebookAccessToken = [dic objectForKey:@"facebook_access_token"];
        self.accessToken = [dic objectForKey:@"access_token"];
        self.avatar = [dic objectForKey:@"avatar"];
        self.deleted = [[dic objectForKey:@"deleted"] boolValue];
        self.createdAt = [dic objectForKey:@"created_at"];
        self.updateAt = [dic objectForKey:@"update_at"];
    }
    return self;
}

- (void)dealloc
{
    [self.userId release];
    [self.username release];
    [self.facebookId release];
    [self.facebookAccessToken release];
    [self.accessToken release];
    [self.avatar release];
    [self.createdAt release];
    [self.updateAt release];
    [super dealloc];
}
@end
