//
//  JTFacebookConnection.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/25/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "JTFacebookConnection.h"
#import <FacebookSDK/FacebookSDK.h>

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
    [self getInfomation];
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
        [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
            NSLog(@"%@",result);
            if(!error)
            {
                JTFacebookEntity *fbEntity = [[JTFacebookEntity alloc] initwithDictionary:[result objectForKey:@"data"]];
                if(self.delegate)
                    [self.delegate loginFacebookSuccess:fbEntity];
            }
        }];
    }
}
@end
