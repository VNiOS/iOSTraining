//
//  JTPostObjectEntity.h
//  JapanTravel
//
//  Created by Xuan Tung on 1/24/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JTPostObjectEntity : NSObject

@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) NSString *value;

- (id)initObjectWithKey:(NSString *)key andValue:(NSString *)value;
@end
