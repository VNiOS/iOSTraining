//
//  PostingEntity.h
//  JapanTravel
//
//  Created by Xuan Tung on 1/22/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostingEntity : NSObject
{
    NSString *_postId;
    NSString *_postUrl;
    NSString *_postThumbUrl;
    NSString *_timePost;
    NSString *_description;
    NSString *_username;
    NSString *_userAvatarUrl;
    NSString *_placeName;
    int _commentCount;
    int _bookmarkCount;
}

@property (nonatomic, retain) NSString *postId;
@property (nonatomic, retain) NSString *postUrl;
@property (nonatomic, retain) NSString *postThumbUrl;
@property (nonatomic, retain) NSString *timePost;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *userAvatarUrl;
@property (nonatomic, retain) NSString *placeName;
@property (nonatomic, assign) int commentCount;
@property (nonatomic, assign) int bookmarkCount;


- (id)initwithDictionary:(NSDictionary *)dict;

@end
