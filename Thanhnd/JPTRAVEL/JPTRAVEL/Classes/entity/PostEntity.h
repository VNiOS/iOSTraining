//
//  PostEntity.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/21/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "BaseEntity.h"

@interface PostEntity : BaseEntity
@property (nonatomic,retain) NSString *postId;
@property (nonatomic, retain) NSString *postUrl;
@property (nonatomic, retain) NSString *postThumbUrl;
@property (nonatomic, retain) NSString *postedAt;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *placeName;
@property (nonatomic) int commentCount;
@property (nonatomic) int bookmarkCount;
@end
