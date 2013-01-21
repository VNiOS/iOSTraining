//
//  PostEntity.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/21/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "BaseEntity.h"
#import "UserEntity.h"
#import "PostEntity.h"
#import "EventEntity.h"
@interface TimelineEntity : BaseEntity
@property (nonatomic,retain) NSString *itemType;
@property (nonatomic, retain) PostEntity *post;
@property (nonatomic, retain) EventEntity *event;
@property (nonatomic, retain) UserEntity *user;

@end
