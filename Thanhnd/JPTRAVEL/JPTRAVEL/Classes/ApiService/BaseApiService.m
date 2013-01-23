//
//  BaseApiService.m
//  JPTRAVEL
//
//  Created by Thanhnd on 1/22/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "BaseApiService.h"
#import "Util.h"
@implementation BaseApiService
@synthesize baseApiServicDelegate;
@synthesize httpRequestGet;
@synthesize httpRequestPost;
@synthesize jsonParser;
const NSString *baseUrlApi =@"http://api.japantravel.icapps.co/";
const NSString *apiTimelineMethod = @"timeline";


-(id) init{
    return [super init];
}
-(id) init:(NSDictionary *)params withMethod:(NSString *) methodName andType:(int) type deleage:(id) delegate;
{
    self = [super init];
    if (params && methodName && type && delegate && self) {
        switch (type) {
            case APIGetMethod:
                httpRequestGet = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:[Util append:baseUrlApi,methodName]]];
                [self buildRequestGet:httpRequestGet withParams:params];
                [httpRequestGet setDelegate:delegate];
                [httpRequestGet startAsynchronous];
                break;
            case APIPostMethod:
                httpRequestPost = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:[Util append:baseUrlApi,methodName]]];
                [self buildRequestPost:httpRequestPost withParams:params];
                [httpRequestPost setDelegate:delegate];
                [httpRequestPost startAsynchronous];
                break;
                
            default:
                break;
        }
    }
    return self;
}

-(ASIHTTPRequest *) buildRequestGet:(ASIHTTPRequest *)request withParams:(NSDictionary *)params;
{
    if(params && request){
        NSArray *keys = [params allKeys];
        for (NSString *key in keys) {
            [request setValue:[params objectForKey:key] forKey:key];
        }
    }
    return request;
}

-(ASIFormDataRequest *) buildRequestPost:(ASIFormDataRequest *)request withParams:(NSDictionary *)params;
{
    if(params && request){
        NSArray *keys = [params allKeys];
        for (NSString *key in keys) {
            [request setPostValue:[params objectForKey:key] forKey:key];
        }
    }
    return request;
}
@end
