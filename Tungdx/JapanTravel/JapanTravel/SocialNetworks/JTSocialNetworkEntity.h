//
//  JTSocialNetworkEntity.h
//  JapanTravel
//
//  Created by Xuan Tung on 1/25/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JTSocialNetworkEntity : NSObject

@property (nonatomic, retain) NSString *accessToken;
@property (nonatomic, retain) NSString *sid;

- (id)initWithDictionary:(NSDictionary *)dic;
@end
