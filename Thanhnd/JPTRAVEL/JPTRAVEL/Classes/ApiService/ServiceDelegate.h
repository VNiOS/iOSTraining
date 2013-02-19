//
//  JAServiceDelegate.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/24/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

@class BaseApiService;

@protocol ServiceDelegate <NSObject>

@optional

// These are the default delegate methods for request status
// You can use different ones by setting didStartSelector / didFinishSelector / didFailSelector
- (void)requestFinished:(BaseApiService *)serviceRespone;
- (void)requestFailed:(BaseApiService *)serviceRespone;


@end