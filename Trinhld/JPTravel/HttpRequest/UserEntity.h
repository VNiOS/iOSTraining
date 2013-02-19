//
//  UserEntity.h
//  JPTravel
//
//  Created by Trinhld on 1/31/13.
//  Copyright (c) 2013 Trinhld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserEntity : NSObject

@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *userAvatar;

- (id)initWithDictionary:(NSDictionary *)dict;

@end
