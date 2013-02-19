//
//  UserEntity.h
//  JapanTravel
//
//  Created by Xuan Tung on 1/24/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserEntity : NSObject
{

}

@property (nonatomic, retain) NSString *userId;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *facebookId;
@property (nonatomic, retain) NSString *facebookAccessToken;
@property (nonatomic, retain) NSString *accessToken;
@property (nonatomic, retain) NSString *avatar;
@property (nonatomic, retain) NSString *createdAt;
@property (nonatomic, retain) NSString *updateAt;
@property (nonatomic, assign) BOOL deleted;

- (id)initwithDictionary:(NSDictionary *)dic;
@end
