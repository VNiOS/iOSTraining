//
//  JTJsonUltils.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/22/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "JTJsonUltils.h"
#import "SBJson.h"

@implementation JTJsonUltils
@synthesize paser=_paser, adapter=_adapter;


- (id)initWithDelegate:(id<SBJsonStreamParserAdapterDelegate>)delegate
{
    [super init];
    if(self)
    {
        self.adapter = [[SBJsonStreamParserAdapter alloc] init];
        [self.adapter setDelegate:delegate];
        self.paser = [[SBJsonStreamParser alloc] init];
        [self.paser setDelegate:self.adapter];
    }
    return self;
}

- (void)parseJson:(NSData *)data
{
    SBJsonStreamParserStatus status = [self.paser parse:data];
    if(status == SBJsonStreamParserError)
    {
        NSLog(@"parser error");
    }
    else if(status == SBJsonStreamParserWaitingForData)
    {
        NSLog(@"parser success");
    }
}

- (void)dealloc
{
    [super dealloc];
    [self.paser release];
    self.paser = nil;
    [self.adapter release];
    self.adapter = nil;
}

@end

