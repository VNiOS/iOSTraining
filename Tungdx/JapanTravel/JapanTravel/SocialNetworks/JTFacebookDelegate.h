//
//  JTFacebookDelegate.h
//  JapanTravel
//
//  Created by Xuan Tung on 1/25/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JTFacebookEntity.h"

@protocol JTFacebookDelegate <NSObject>
@optional
- (void)loginFacebookSuccess:(JTFacebookEntity *)object;
@end
