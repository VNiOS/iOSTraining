//
//  PostEntity.m
//  JPTRAVEL
//
//  Created by Thanhnd on 1/21/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "PostEntity.h"

@implementation PostEntity
@synthesize postId,placeName,postedAt,postThumbUrl,postUrl,description,commentCount,bookmarkCount;

-(id) initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    if (self) {
        
        if(dict){
            self.postId = [dict valueForKeyPath:@"id"];
            self.description = [dict objectForKey:@"description"];
            self.placeName = [dict objectForKey:@"place_name"];
            self.postedAt = [dict objectForKey:@"posted_at"];
            self.postThumbUrl = [dict objectForKey:@"post_thumb_url"];
            self.postUrl = [dict objectForKey:@"post_url"];
            self.commentCount = [[dict objectForKey:@"comment_count"] integerValue];
            self.bookmarkCount = [[dict objectForKey:@"bookmark_count"] integerValue];  
        }
    }
    
    return self;
}

@end
