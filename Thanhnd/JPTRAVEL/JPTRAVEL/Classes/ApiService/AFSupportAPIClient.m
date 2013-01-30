//
//  AFSupportAPIClient.m
//  JPTRAVEL
//
//  Created by Thanhnd on 1/29/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "AFSupportAPIClient.h"
#import "AFJSONRequestOperation.h"
#import "ServiceConfig.h"

@implementation AFSupportAPIClient
+ (AFSupportAPIClient *)sharedClient
{
    static AFSupportAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFSupportAPIClient alloc] initWithBaseURL:[NSURL URLWithString:SVApiServerAddress]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}
@end
