//
//  UserService.m
//  JPTRAVEL
//
//  Created by Thanhnd on 1/25/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "UserService.h"

NSString * const SVUser = @"users";
NSString * const SVDeleteMethod = @"delete";
NSString * const SVAccessToken = @"access_token";
NSString * const SVLoginFacebook = @"login/facebook";
@implementation UserService

-(void) deleteUser:(NSString *)accessToken
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:accessToken forKey:SVAccessToken];
    [self buildRequestPostGroup:SVUser methodName:SVDeleteMethod withParams:dict];
    [dict release];
}

-(void) buildData
{
    
}
@end
