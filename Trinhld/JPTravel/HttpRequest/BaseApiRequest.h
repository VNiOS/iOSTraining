//
//  BaseApiRequest.h
//  JPTravel
//
//  Created by Trinhld on 1/31/13.
//  Copyright (c) 2013 Trinhld. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "SBJson.h"


@protocol APIRequestDelegate <NSObject>

- (void)didReceiveData:(NSDictionary *)dict;

@end

@interface BaseApiRequest : NSObject <SBJsonStreamParserAdapterDelegate>

@property (strong, nonatomic) SBJsonStreamParserAdapter *jsonAdapter;
@property (strong, nonatomic) SBJsonStreamParser *jsonParser;
@property (strong, nonatomic) NSDictionary *paramsDict;
@property (nonatomic, weak) id<APIRequestDelegate> delegate;

- (void) buildRequest:(NSString *)group params:(NSDictionary *)params;
@end
