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
            
            if([dict valueForKey:@"id"] != (id)[NSNull null]){
                self.postId = [dict objectForKey:@"id"];
            }
            if([dict valueForKey:@"description"] != (id)[NSNull null] && [[dict valueForKey:@"description"] length] != 0){
                self.description = [dict objectForKey:@"description"];
            }
            if([dict valueForKey:@"place_name"] != (id)[NSNull null] && [[dict valueForKey:@"place_name"] length] != 0){
                self.placeName = [dict objectForKey:@"place_name"];
            }
            if([dict valueForKey:@"posted_at"] != (id)[NSNull null] && [[dict valueForKey:@"posted_at"] length] != 0){
                self.postedAt = [dict objectForKey:@"posted_at"];
            }
            if([dict valueForKey:@"post_thumb_url"] != (id)[NSNull null] && [[dict valueForKey:@"post_thumb_url"] length] != 0){
                self.postThumbUrl = [dict objectForKey:@"post_thumb_url"];
            }
            if([dict valueForKey:@"post_url"] != (id)[NSNull null] && [[dict valueForKey:@"post_url"] length] != 0){
                self.postUrl = [dict objectForKey:@"post_url"];
            }
            
            if([dict valueForKey:@"comment_count"] != (id)[NSNull null]){
                self.commentCount = [[dict objectForKey:@"comment_count"] integerValue];
            }
            if([dict valueForKey:@"bookmark_count"] != (id)[NSNull null]){
                self.bookmarkCount = [[dict objectForKey:@"bookmark_count"] integerValue];
            }     
        }
    }
    
    return self;
}

@end
