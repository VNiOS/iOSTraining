//
//  PostEntity.h
//  JPTravel
//
//  Created by Trinhld on 1/31/13.
//  Copyright (c) 2013 Trinhld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostEntity : NSObject

@property (strong, nonatomic) NSString *postAt;
@property (strong, nonatomic) NSString *postUrl;
@property (strong, nonatomic) NSString *postThumbUrl;
@property (strong, nonatomic) NSString *placeName;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *commentCount;
@property (strong, nonatomic) NSString *bookmarkCount;

- (id)initWithDictionary:(NSDictionary *)dict;
@end
