//
//  JTBaseService.h
//  JapanTravel
//
//  Created by Xuan Tung on 1/24/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "JTBaseServiceDelegate.h"

#define SERVER_ADDRESS @"http://api.japantravel.icapps.co"

#define LOGIN_API_TAG 1

#define LOGIN_API @"/users/login/facebook"

@interface JTBaseService : NSObject
{
    id<ASIHTTPRequestDelegate> baseSirvicedelegate;
}
@property (nonatomic, assign) id<JTBaseServiceDelegate> delegate;
@property (nonatomic, retain) ASIHTTPRequest *getDataRequest;
@property (nonatomic, retain) ASIFormDataRequest *postDataRequest;


- (void)getDataRequest:(NSURL *)url withMethod:(NSString *)method andTag:(NSInteger )tag;
- (void)postFormDataRequest:(NSURL *)url withArray:(NSArray *)list andTag:(NSInteger )tag;
@end
