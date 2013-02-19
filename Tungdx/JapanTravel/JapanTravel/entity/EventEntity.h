//
//  EventEntity.h
//  JapanTravel
//
//  Created by Xuan Tung on 1/22/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventEntity : NSObject
{
    NSString *_eventId;
    NSString *_eventName;
    NSString *_eventDescription;
    NSString *_imageUrl;
    NSString *_startTime;
    NSString *_endTime;
}
@property (nonatomic, retain) NSString *eventId;
@property (nonatomic, retain) NSString *eventName;
@property (nonatomic, retain) NSString *eventDescription;
@property (nonatomic, retain) NSString *imageUrl;
@property (nonatomic, retain) NSString *startTime;
@property (nonatomic, retain) NSString *endTime;

- (id)initwithDictionary:(NSDictionary *)dict;
@end
