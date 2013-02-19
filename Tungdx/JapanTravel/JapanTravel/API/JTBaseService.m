//
//  JTBaseService.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/24/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "JTBaseService.h"
#import "JTPostObjectEntity.h"

@implementation JTBaseService
@synthesize getDataRequest=_getDataRequest, postDataRequest=_postDataRequest,delegate=_delegate;

- (void)getDataRequest:(NSURL *)url andTag:(NSInteger )tag
{
    self.getDataRequest = [[ASIHTTPRequest alloc] initWithURL:url];
    [self.getDataRequest setRequestMethod:@"GET"];
    [self.getDataRequest setTag:tag];
    [self.getDataRequest setDelegate:baseSirvicedelegate];
    [self.getDataRequest startAsynchronous];
}

- (void)postFormDataRequest:(NSURL *)url withArray:(NSArray *)list andTag:(NSInteger )tag
{
    self.postDataRequest = [[ASIFormDataRequest alloc] initWithURL:url];
    for (int i=0;i<list.count;i++) {
        JTPostObjectEntity *object = [list objectAtIndex:i];
        [self.postDataRequest setPostValue:object.value forKey:object.key];
    }
    [self.postDataRequest setTag:tag];
    [self.postDataRequest setDelegate:baseSirvicedelegate];
    [self.postDataRequest startAsynchronous];
}

@end
