//
//  JTPostObjectEntity.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/24/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "JTPostObjectEntity.h"

@implementation JTPostObjectEntity
@synthesize key=_key, value=_value;

- (id)initObjectWithKey:(NSString *)key andValue:(NSString *)value
{
    self = [super init];
    if(self)
    {
        self.key = key;
        self.value = value;
    }
    return self;
}

- (void)dealloc
{
    [self.key release];
    [self.value release];
    [super dealloc];
}
@end
