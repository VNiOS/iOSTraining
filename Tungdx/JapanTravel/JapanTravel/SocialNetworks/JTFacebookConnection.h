//
//  JTFacebookConnection.h
//  JapanTravel
//
//  Created by Xuan Tung on 1/25/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JTSocialNetworkConnection.m"
#import "JTFacebookDelegate.h"

@interface JTFacebookConnection : NSObject
{
    
}
@property (nonatomic, assign) id<JTFacebookDelegate> delegate;
- (void)loginFacebook;
@end
