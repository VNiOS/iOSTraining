//
//  BaseApiService.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/22/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "JsonParser.h"
extern const NSString *baseUrlApi;
extern const NSString *apiTimelineMethod;

@protocol BaseApiServiceDelegate <NSObject>
@optional

@end
@interface BaseApiService : NSObject
{

}

enum  {
    APIGetMethod            = 0,
    APIPostMethod           = 1
};

#pragma mark - DECLARE PROPERTY
@property (nonatomic, retain) ASIHTTPRequest *httpRequestGet;
@property (nonatomic, retain) ASIFormDataRequest *httpRequestPost;
@property (nonatomic, retain) JsonParser *jsonParser;
@property (nonatomic, retain) id<BaseApiServiceDelegate> baseApiServicDelegate;
#pragma mark - DECLARE METHOD
//INIT
-(id) init;

//Build request with api host, type: APIGetMethod - 0 - GET,APIPostMethod - 1 - POST
-(id) init:(NSDictionary *)params withMethod:(NSString *) methodName andType:(int) type deleage:(id) delegate;

-(ASIHTTPRequest *) buildRequestGet:(ASIHTTPRequest *)request withParams:(NSDictionary *)params;

-(ASIFormDataRequest *) buildRequestPost:(ASIFormDataRequest *)request withParams:(NSDictionary *)params;
@end
