//
//  ASIBaseApiService.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/22/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "JsonParser.h"
#import "ServiceDelegate.h"
#import "ServiceConfig.h"

@interface ASIBaseApiService : NSObject
{
    id <ServiceDelegate> delegate;
    SEL didFinishSelector;
    SEL didFailedSelector;
    ASIHTTPRequest *httpRequestGet;
    ASIFormDataRequest *httpRequestPost;
    NSDictionary *dictData;
    NSMutableArray *arrayData;
    NSInteger tag;
}


#pragma mark - DECLARE PROPERTY
@property (nonatomic, retain) ASIHTTPRequest *httpRequestGet;
@property (nonatomic, retain) ASIFormDataRequest *httpRequestPost;
@property (nonatomic, retain) JsonParser *jsonParser;
@property (nonatomic, retain) NSDictionary *dictData;
@property (nonatomic, retain) NSMutableArray *arrayData;

@property (assign, nonatomic) id delegate;
@property (assign) SEL didFinishSelector;
@property (assign) SEL didFailedSelector;
@property (assign) NSInteger tag;
#pragma mark - DECLARE METHOD
//INIT
-(id) init;

//When API have only Group Name and using method HTTP Get
-(void) buildRequestGetGroup:(NSString *)groupName withParams:(NSDictionary *)params;
//When API have only Group Name and using method HTTP Post
-(void) buildRequestPostGroup:(NSString *)groupName withParams:(NSDictionary *)params;
//When API have Group Name and Method Name using method HTTP Get
-(void) buildRequestGetGroup:(NSString *)groupName methodName:(NSString *) methodName withParams:(NSDictionary *)params;
//When API have Group Name and Method Name using method HTTP Post
-(void) buildRequestPostGroup:(NSString *)groupName methodName:(NSString *) methodName withParams:(NSDictionary *)params;
//This method call back when received data (data in property dictData)
-(void) buildData;
@end
