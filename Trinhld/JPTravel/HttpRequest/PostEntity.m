//
//  PostEntity.m
//  JPTravel
//
//  Created by Trinhld on 1/31/13.
//  Copyright (c) 2013 Trinhld. All rights reserved.
//

#import "PostEntity.h"

@implementation PostEntity

@synthesize postAt, postThumbUrl, postUrl, placeName, description, commentCount, bookmarkCount;

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self && dict) {
        self.postAt = ([dict objectForKey:@"posted_at"] != [NSNull null]) ? [dict objectForKey:@"posted_at"] : nil;
        self.postThumbUrl = ([dict objectForKey:@"post_thumb_url"] != [NSNull null]) ? [dict objectForKey:@"post_thumb_url"] : nil;
        self.postUrl = ([dict objectForKey:@"post_url"] != [NSNull null]) ? [dict objectForKey:@"post_url"] : nil;
        self.placeName = ([dict objectForKey:@"place_name"] != [NSNull null]) ? [dict objectForKey:@"place_name"] : nil;
        self.description = ([dict objectForKey:@"description"] != [NSNull null]) ? [dict objectForKey:@"description"] : nil;
        self.commentCount = ([dict objectForKey:@"comment_count"] != [NSNull null]) ? [dict objectForKey:@"comment_count"] : nil;
        self.bookmarkCount = ([dict objectForKey:@"bookmark_count"] != [NSNull null]) ? [dict objectForKey:@"bookmark_count"] : nil;
    }
    return self;
}

@end
