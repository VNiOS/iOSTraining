//
//  PostingEntity.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/22/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "PostingEntity.h"

@implementation PostingEntity
@synthesize postId=_postId, postUrl=_postUrl, postThumbUrl=_postThumbUrl, timePost=_timePost, description=_description, username=_username, userAvatarUrl=_userAvatarUrl, placeName=_placeName, commentCount=_commentCount, bookmarkCount=_bookmarkCount;
- (id)initwithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if(self)
    {
        self.postId = [dict objectForKey:@"id"];
        self.postUrl = [dict objectForKey:@"post_url"];
        self.postThumbUrl = [dict objectForKey:@"post_thumb_url"];
        self.timePost = [dict objectForKey:@"posted_at"];
        self.description = [dict objectForKey:@"description"];
        self.username = [dict objectForKey:@"user_name"];
        self.userAvatarUrl = [dict objectForKey:@"user_avatar"];
        self.placeName = [dict objectForKey:@"place_name"];
        self.commentCount = [[dict objectForKey:@"comment_count"] intValue];
        self.bookmarkCount = [[dict objectForKey:@"bookmark_count"] intValue];
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
    [self.postId release];
    self.postId = nil;
    [self.postUrl release];
    self.postUrl = nil;
    [self.postThumbUrl release];
    self.postThumbUrl = nil;
    [self.timePost release];
    self.timePost = nil;
    [self.description release];
    self.description = nil;
    [self.username release];
    self.username = nil;
    [self.userAvatarUrl release];
    self.userAvatarUrl = nil;
    [self.placeName release];
    self.placeName = nil;
}
@end
