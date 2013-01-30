//
//  UserService.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/25/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "BaseApiService.h"

FOUNDATION_EXPORT NSString * const SVUser;
FOUNDATION_EXPORT NSString * const SVDeleteMethod;
FOUNDATION_EXPORT NSString * const SVAccessToken;
@interface UserService : BaseApiService

//Delete user have SERVER_ACCESS_TOKEN
-(void) deleteUser:(NSString *) accessToken;

@end
