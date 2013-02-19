//
//  JTJsonParseBase.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/24/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "JTJsonParseBase.h"

@implementation JTJsonParseBase
@synthesize adapter=_adapter, parse=_parse, tag=_tag, delegate=_delegate;

- (id)initWithDelegate:(id<SBJsonStreamParserAdapterDelegate>)delegate
{
    self = [super init];
    if(self)
    {
        self.adapter = [[SBJsonStreamParserAdapter alloc] init];
        [self.adapter setDelegate:delegate];
        self.parse = [[SBJsonStreamParser alloc] init];
        [self.parse setDelegate:self.adapter];
    }
    return self;
}

- (void)parseJsonData:(NSData *)data
{
    [self.parse parse:data];
}

- (void)parser:(SBJsonStreamParser *)parser foundArray:(NSArray *)array
{   

}

- (void)parser:(SBJsonStreamParser *)parser foundObject:(NSDictionary *)dict
{

}

- (void) dealloc
{
    [super dealloc];
    [self.adapter release];
    [self.parse release];
}

@end
