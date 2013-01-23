//
//  JTJsonUltils.h
//  JapanTravel
//
//  Created by Xuan Tung on 1/22/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBJson.h"

@interface JTJsonUltils : NSObject
{
    SBJsonStreamParser *_paser;
    SBJsonStreamParserAdapter *_adapter;
}

@property (nonatomic, retain) SBJsonStreamParser *paser;
@property (nonatomic, retain) SBJsonStreamParserAdapter *adapter;

- (void)parseJson:(NSData *)data;
- (id)initWithDelegate:(id <SBJsonStreamParserAdapterDelegate> )delegate;
@end
