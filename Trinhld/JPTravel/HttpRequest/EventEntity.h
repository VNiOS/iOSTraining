//
//  EventEntity.h
//  JPTravel
//
//  Created by Trinhld on 1/31/13.
//  Copyright (c) 2013 Trinhld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventEntity : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *imageUrl;
@property (strong, nonatomic) NSString *startTime;
@property (strong, nonatomic) NSString *endTime;

- (id)initWithDictionary:(NSDictionary *)dict;
@end
