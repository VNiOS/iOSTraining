//
//  AFSupportAPIClient.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/29/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "AFHTTPClient.h"

@interface AFSupportAPIClient : AFHTTPClient
+ (AFSupportAPIClient *)sharedClient;
@end
