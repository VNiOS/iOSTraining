//
//  JTFacebookEntity.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/25/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "JTFacebookEntity.h"

@implementation JTFacebookEntity

- (id)initWithDictionary:(NSDictionary *)dic
{
    self = [super initwithDictionary:dic];
    if(self)
    {
        self.name = [dic objectForKey:@"name"];
        self.avatar = [dic objectForKey:@"avatar"];
    }
    return self;
}

- (void)dealloc
{
    [self.name release];
    [self.avatar release];
    [super dealloc];
}
@end
