//
//  TimelineEntity.h
//  JPTravel
//
//  Created by Trinhld on 2/1/13.
//  Copyright (c) 2013 Trinhld. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserEntity.h"
#import "PostEntity.h"
#import "EventEntity.h"

@interface TimelineEntity : NSObject

@property (strong, nonatomic) NSString *itemType;
@property (strong, nonatomic) UserEntity *user;
@property (strong, nonatomic) PostEntity *post;
@property (strong, nonatomic) EventEntity *event;

- (id) initWithDictionary:(NSDictionary *)dict;

@end
