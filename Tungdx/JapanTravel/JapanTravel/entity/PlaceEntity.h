//
//  PlaceEntity.h
//  JapanTravel
//
//  Created by Xuan Tung on 1/21/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlaceEntity : NSObject
{
    NSString *_placeId;
    NSString *_imageUrl;
    NSString *_placeName;
}
@property (nonatomic, retain) NSString *placeId;
@property (nonatomic, retain) NSString *imageUrl;
@property (nonatomic, retain) NSString *placeName;

- (id)initwithDictionary:(NSDictionary *)dic;
@end
