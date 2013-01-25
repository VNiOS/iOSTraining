//
//  JTBaseServiceDelegate.h
//  JapanTravel
//
//  Created by Xuan Tung on 1/24/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ASIHTTPRequest;

@protocol JTBaseServiceDelegate <NSObject>
@optional
- (void)requestServiceFinished:(ASIHTTPRequest *)request;
- (void)requestServiceFailed:(ASIHTTPRequest *)request;

- (void)responseDataSuccessFromService:(NSObject *)object error:(NSError *)error;
@end
