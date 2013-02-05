//
//  BaseApiRequest.m
//  JPTravel
//
//  Created by Trinhld on 1/31/13.
//  Copyright (c) 2013 Trinhld. All rights reserved.
//

#import "BaseApiRequest.h"

@interface BaseApiRequest ()
{

}

@end

@interface BaseApiRequest (ASIHttpRequestDelegate) <ASIHTTPRequestDelegate>

@end

@implementation BaseApiRequest

@synthesize jsonAdapter, jsonParser, paramsDict, delegate;

- (id) init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void) buildRequest:(NSString *)group params:(NSDictionary *)params
{
    if (!group) {
        NSLog(@"Empty group name");
    }
    if (!params) {
        NSLog(@"Empty parameter");
    }
    if (group && params)
    {
        NSString *severAddress = [NSString stringWithFormat:@"http://api.japantravel.icapps.co/"];
        NSString *buildUrl = [NSString stringWithFormat:@"%@%@?", severAddress, group];
        NSArray *keys = [params allKeys];
        for (NSString *key in keys) {
            buildUrl = [NSString stringWithFormat:@"%@%@=%@&", buildUrl, key, [params objectForKey:key]];
        }
        buildUrl = [buildUrl substringWithRange:NSMakeRange(0, [buildUrl length]-1)];
        
        ASIHTTPRequest *request = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:@"http://api.japantravel.icapps.co/timeline?offset=1&limit=20"]];
        [request setDelegate:self];
        [request startAsynchronous];
    }
}


- (void)parser:(SBJsonStreamParser *)parser foundObject:(NSDictionary *)dict
{
    NSString *callStatus = [NSString stringWithFormat:@"%@", [dict objectForKey:@"status"]];
    if ([callStatus isEqualToString:@"success"]) {
        NSDictionary *dataResponse = [dict objectForKey:@"data"];
        [self.delegate didReceiveData:dataResponse];
    }
}

- (void)parser:(SBJsonStreamParser *)parser foundArray:(NSArray *)array
{
    
}

@end

@implementation BaseApiRequest (ASIHttpRequestDelegate)

- (void)requestFinished:(ASIHTTPRequest *)request
{
    jsonAdapter = [[SBJsonStreamParserAdapter alloc] init];
    jsonAdapter.delegate = self;
    jsonParser = [[SBJsonStreamParser alloc] init];
    jsonParser.delegate = jsonAdapter;
    [jsonParser parse:request.responseData];
}

- (void)requestFailed:(ASIHTTPRequest *)request {
    NSLog(@"fail");
}

@end
