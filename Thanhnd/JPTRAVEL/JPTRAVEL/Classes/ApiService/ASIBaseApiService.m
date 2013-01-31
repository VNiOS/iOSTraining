//
//  ASIBaseApiService.m
//  JPTRAVEL
//
//  Created by Thanhnd on 1/22/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "ASIBaseApiService.h"
#import "Util.h"
#import <SBJson/SBJson.h>
#import <SBJson/SBJsonStreamParserAdapter.h>
#import <SBJson/SBJsonStreamParser.h>
@interface ASIBaseApiService (){
    SBJsonStreamParserAdapter *jsonAdapter;
    SBJsonStreamParser *parser;
}

@end
@interface ASIBaseApiService (SBJsonStreamParserAdapterDelegate) <SBJsonStreamParserAdapterDelegate>

@end

@implementation ASIBaseApiService
@synthesize httpRequestGet;
@synthesize httpRequestPost;
@synthesize jsonParser;
@synthesize delegate;
@synthesize didFinishSelector;
@synthesize didFailedSelector;
@synthesize dictData;
@synthesize arrayData;
@synthesize tag;

-(id) init{
    self = [super init];
    [self setDidFinishSelector:@selector(requestFinished:)];
	[self setDidFailedSelector:@selector(requestFailed:)];
    return self;
}

-(void) buildRequestGetGroup:(NSString *) groupName withParams:(NSDictionary *)params
{
    if(params && groupName){
        NSArray *keys = [params allKeys];
        NSString *stringParam = [NSString stringWithFormat:@"%@%@?",SVApiServerAddress,groupName];
        for (NSString *key in keys) {
            stringParam = [NSString stringWithFormat:@"%@%@=%@&",stringParam,key,[params objectForKey:key]];
        }
        stringParam = [stringParam substringWithRange:NSMakeRange(0, [stringParam length]-1)];
        httpRequestGet = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:stringParam]];
        httpRequestGet.delegate = self;
        [httpRequestGet setDidFinishSelector:@selector(didFinishSelector:)];
        [httpRequestGet setDidFailSelector:@selector(didFailSelector:)];
        [httpRequestGet startAsynchronous];
    }
}

-(void) buildRequestPostGroup:(NSString *)groupName withParams:(NSDictionary *)params
{
    if(params && groupName){
        httpRequestPost = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",SVApiServerAddress,groupName]]];
        NSArray *keys = [params allKeys];
        for (NSString *key in keys) {
            [httpRequestPost setValue:[params objectForKey:key] forKey:key];
        }
        httpRequestPost.delegate = self;
        [httpRequestPost setDidFinishSelector:@selector(didFinishSelector:)];
        [httpRequestPost setDidFailSelector:@selector(didFailSelector:)];
        [httpRequestPost startAsynchronous];
    }
}

-(void) buildRequestGetGroup:(NSString *)groupName methodName:(NSString *)methodName withParams:(NSDictionary *)params
{
    groupName = [NSString stringWithFormat:@"%@/%@",groupName,methodName];
    [self buildRequestGetGroup:groupName withParams:params];
}

-(void) buildRequestPostGroup:(NSString *)groupName methodName:(NSString *)methodName withParams:(NSDictionary *)params
{
    groupName = [NSString stringWithFormat:@"%@/%@",groupName,methodName];
    [self buildRequestPostGroup:groupName withParams:dictData];
}

- (void) didFinishSelector:(ASIHTTPRequest *) response
{
        jsonAdapter = [[SBJsonStreamParserAdapter alloc] init];
        jsonAdapter.delegate = self;
        parser = [[SBJsonStreamParser alloc] init];
        parser.delegate = jsonAdapter;
        parser.supportMultipleDocuments = YES;
        NSData* data = [response responseData];
        [parser parse:data];
}

- (void) didFailSelector:(ASIHTTPRequest *) response
{
    //Request faild can show error network right here
    if (delegate && [delegate respondsToSelector:didFailedSelector]) {
        [delegate performSelector:didFailedSelector withObject:self];
    }
}

-(void)buildData
{
    if (delegate && [delegate respondsToSelector:didFinishSelector]) {
        [delegate performSelector:didFinishSelector withObject:self];
    }
}

-(void) dealloc
{
    [dictData release];
    [arrayData release];
    [jsonAdapter release];
    if(httpRequestGet){
        [httpRequestGet release];
    }
    if (httpRequestPost) {
        [httpRequestPost release];
    }
    [super dealloc];
}
@end

@implementation ASIBaseApiService (SBJsonStreamParserAdapterDelegate)
- (void)parser:(SBJsonStreamParser*)parser foundArray:(NSArray*)array
{
    
}

- (void)parser:(SBJsonStreamParser*)parser foundObject:(NSDictionary*)dict
{
    NSString *status = [dict objectForKey:@"status"];
    if ([status isEqualToString:@"success"]) {
        NSDictionary *dicData = [dict objectForKey:@"data"];
        if (dicData != nil) {
            self.dictData = dicData;
            [self performSelectorOnMainThread:@selector(buildData) withObject:nil waitUntilDone:[NSThread isMainThread]];
        }
    }

    if([status isEqualToString:@"fail"]){
         //Do it when server respone message fail
    }

    if([status isEqualToString:@"error"]){
        //Do it when server respone message error
    }

}



@end
