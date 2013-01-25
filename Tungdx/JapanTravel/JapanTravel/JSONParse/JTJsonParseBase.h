//
//  JTJsonParseBase.h
//  JapanTravel
//
//  Created by Xuan Tung on 1/24/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBJson.h"
#import "JTJsonParseDelegate.h"

@interface JTJsonParseBase : NSObject
{
    
}
@property (nonatomic, assign) id<JTJsonParseDelegate> delegate;
@property (nonatomic, assign) int tag;
@property (nonatomic, retain) SBJsonStreamParser *parse;
@property (nonatomic, retain) SBJsonStreamParserAdapter *adapter;

- (void)parseJsonData:(NSData *)data;
- (id)initWithDelegate:(id<SBJsonStreamParserAdapterDelegate>)delegate;
@end
