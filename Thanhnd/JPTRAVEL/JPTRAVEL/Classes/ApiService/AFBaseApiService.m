//
//  AFBaseApiService.m
//  JPTRAVEL
//
//  Created by Thanhnd on 1/29/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "AFBaseApiService.h"
#import "AFSupportAPIClient.h"

@implementation AFBaseApiService
@synthesize arrayData;
@synthesize delegate;
@synthesize dictData;
@synthesize didFinishSelector;
@synthesize didFailedSelector;
@synthesize tag;

-(id) init{
    self = [super init];
    [self setDidFinishSelector:@selector(requestFinished:)];
	[self setDidFailedSelector:@selector(requestFailed:)];
    return self;
}

-(void)buildRequestGetGroup:(NSString *)groupName withParams:(NSDictionary *)params
{
    [[AFSupportAPIClient sharedClient] getPath:groupName parameters:params success:^(AFHTTPRequestOperation *operation, id JSON) {
        [self didFinishSelector:operation WithJSON:JSON];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self didFailSelector:operation WithError:error];
    }];
}

-(void)buildRequestPostGroup:(NSString *)groupName withParams:(NSDictionary *)params
{
    [[AFSupportAPIClient sharedClient] postPath:groupName parameters:params success:^(AFHTTPRequestOperation *operation, id JSON) {
        [self didFinishSelector:operation WithJSON:JSON];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self didFailSelector:operation WithError:error];
    }];
}

-(void) buildRequestPostGroup:(NSString *)groupName methodName:(NSString *)methodName withParams:(NSDictionary *)params
{
    groupName = [NSString stringWithFormat:@"%@/%@",groupName,methodName];
    [self buildRequestPostGroup:groupName withParams:dictData];
}

-(void) buildRequestGetGroup:(NSString *)groupName methodName:(NSString *)methodName withParams:(NSDictionary *)params
{
    groupName = [NSString stringWithFormat:@"%@/%@",groupName,methodName];
    [self buildRequestGetGroup:groupName withParams:params];
}

- (void) didFinishSelector:(AFHTTPRequestOperation *) operation WithJSON:(id) JSON
{
    NSString *status = [JSON valueForKeyPath:@"status"];
    if ([status isEqualToString:@"success"]) {
        NSDictionary *dicData = [JSON valueForKeyPath:@"data"];
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

- (void) didFailSelector:(AFHTTPRequestOperation *) operation WithError:(NSError *) error
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
@end
