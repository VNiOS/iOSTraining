//
//  BaseResponseEntity.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/25/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "BaseResponseEntity.h"

@implementation BaseResponseEntity
@synthesize message=_message;


- (void)dealloc
{
    [self.message release];
    [super dealloc];
}
@end
