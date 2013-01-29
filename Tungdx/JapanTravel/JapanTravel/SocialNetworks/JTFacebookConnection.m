//
//  JTFacebookConnection.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/25/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "JTFacebookConnection.h"
#import <FacebookSDK/FacebookSDK.h>
#import "JTFacebookEntity.h"
@implementation JTFacebookConnection
@synthesize delegate=_delegate;

- (id)init
{
    self = [super init];
    if(self)
    {
        
    }
    return self;
}

- (void)sessionStateChanged:(FBSession *)session state:(FBSessionState)state error:(NSError *)error
{
    switch (state) {
        case FBSessionStateOpen:
            NSLog(@"state open");
            [self getInfomation];
            break;
        case FBSessionStateClosed:
            NSLog(@"state closed");
            break;
        case FBSessionStateClosedLoginFailed:
            NSLog(@"state closed login failed");
            [FBSession.activeSession closeAndClearTokenInformation];
        default:
            break;
    }
    
}

- (BOOL)openSessionWithAllowLoginUI:(BOOL)allowUI
{
    return [FBSession openActiveSessionWithReadPermissions:nil allowLoginUI:allowUI completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
        [self sessionStateChanged:session state:status error:error];
    }];
}

- (void)loginFacebook
{
    if(![self openSessionWithAllowLoginUI:NO])
        [self openSessionWithAllowLoginUI:YES];
}

- (void)getInfomation
{
    if([FBSession.activeSession isOpen])
    {
        NSString *fql = @"SELECT uid, name, pic_square FROM user where uid = me()";
        NSDictionary *query = [NSDictionary dictionaryWithObjectsAndKeys:fql, @"q", nil];
        [FBRequestConnection startWithGraphPath:@"/fql" parameters:query HTTPMethod:@"GET" completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
            
                if(!error)
                {
                    NSArray *dicResult = (NSArray *)[result objectForKey:@"data"] ;
                    NSLog(@"%@",dicResult);
                    FBGraphObject *object = [dicResult objectAtIndex:0];
                    NSMutableDictionary *fbDictionary = [[NSMutableDictionary alloc] init];
                    [fbDictionary setValue:[object objectForKey:@"pic_square"] forKey:@"avatar"];
                    [fbDictionary setValue:[[FBSession activeSession] accessToken] forKey:@"accessToken"];
                    [fbDictionary setValue:[object objectForKey:@"name"] forKey:@"name"];
                    [fbDictionary setValue:[object objectForKey:@"uid"] forKey:@"sid"];
                    JTFacebookEntity *fbEntity = [[JTFacebookEntity alloc] initWithDictionary:fbDictionary];
                    if(self.delegate)
                        [self.delegate loginFacebookSuccess:fbEntity];
                }
        }];
    }
}

@end
