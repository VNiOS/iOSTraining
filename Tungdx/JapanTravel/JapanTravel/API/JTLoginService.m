//
//  JTLoginService.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/24/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "JTLoginService.h"
#import "JTBaseService.h"
#import "JTPostObjectEntity.h"
#import "JTJsonUltils.h"
#import "UserEntity.h"

@implementation JTLoginService

- (id)initWithDelegate:(id<JTBaseServiceDelegate>)delegate
{
    self = [super init];
    if(self)
    {
        baseSirvicedelegate = self;
        self.delegate = delegate;
    }
    return self;
}
- (void)LoginAsFacebookAccount:(NSString *)facebookId andName:(NSString *)name andAvata:(NSString *)avatar andFacebookAcesstoken:(NSString *)fbAcessToken
{
    NSString *requestString = [NSString stringWithFormat:@"%@%@",SERVER_ADDRESS,LOGIN_API];
    NSURL *requestUrl = [NSURL URLWithString:requestString];
    
    NSMutableArray *listObject = [[NSMutableArray alloc] init];

    JTPostObjectEntity *postObject1 = [[JTPostObjectEntity alloc]initObjectWithKey:@"facebook_id" andValue:facebookId];
    [listObject addObject:postObject1];
    [postObject1 release];

    JTPostObjectEntity *postObject2 = [[JTPostObjectEntity alloc]initObjectWithKey:@"name" andValue:name];
    [listObject addObject:postObject2];
    [postObject2 release];
    
    JTPostObjectEntity *postObject3 = [[JTPostObjectEntity alloc]initObjectWithKey:@"avatar" andValue:avatar];
    [listObject addObject:postObject3];
    [postObject3 release];
    
    JTPostObjectEntity *postObject4 = [[JTPostObjectEntity alloc]initObjectWithKey:@"facebook_access_token" andValue:fbAcessToken];
    [listObject addObject:postObject4];
    [postObject4 release];
    
    [super  postFormDataRequest:requestUrl withArray:listObject andTag:LOGIN_API_TAG];
}

- (void)dealloc
{
    [super dealloc];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    if(request.tag == LOGIN_API_TAG)
    {
        JTLoginJsonParse *parseJson = [[JTLoginJsonParse alloc] initwithTag:LOGIN_API_TAG andDelegate:self];
        [parseJson parseJsonData:request.responseData];
    }
}
- (void)requestFailed:(ASIHTTPRequest *)request
{
    
}

- (void)parseDataSuccess:(NSObject *)object withTag:(int)tag error:(NSError *)error
{
    if(tag == LOGIN_API_TAG)
    {
        if(self.delegate)
            [self.delegate responseDataSuccessFromService:object error:error];
    }
}

@end
