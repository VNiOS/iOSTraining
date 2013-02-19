//
//  EventEntity.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/21/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "BaseEntity.h"

@interface EventEntity : BaseEntity
@property (nonatomic, retain) NSString *eventId;
@property (nonatomic, retain) NSString *imageUrl;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *startTime;
@property (nonatomic, retain) NSString *endTime;
@end
