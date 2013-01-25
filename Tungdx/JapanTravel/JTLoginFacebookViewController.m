//
//  JTLoginFacebookViewController.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/24/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "JTLoginFacebookViewController.h"

@interface JTLoginFacebookViewController ()

@end

@implementation JTLoginFacebookViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIButton *buttonFacebookLogin = [[UIButton alloc] initWithFrame:CGRectMake(30, 210, 260, 40)];
    [buttonFacebookLogin setBackgroundImage:[UIImage imageNamed:@"silver-button-normal.png"] forState:UIControlStateNormal];
    [buttonFacebookLogin.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
    [buttonFacebookLogin setTitle:@"Login as Facebook Account" forState:UIControlStateNormal];
    [buttonFacebookLogin setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonFacebookLogin addTarget:self action:@selector(loginFacebook) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonFacebookLogin];
    [buttonFacebookLogin release];
}

//- (void)loginFacebook
//{
////    NSLog(@"Login facebook");
////    JTLoginService *login = [[JTLoginService alloc] initWithDelegate:self];
////    [login LoginAsFacebookAccount:@"abc" andName:@"xyz" andAvata:@"http://profile.ak.fbcdn.net/hprofile-ak-ash3/c0.42.345.345/s160x160/564953_602047323154661_65992317_n.jpg" andFacebookAcesstoken:@"BAAaadfdasfsadsfasdfasdSVajkls;dfjOvqGPXYKJcvzzZChDcK7hChE1RazoZA3m4LNQiKyrvCZC49w"];
//    
//    JTFacebookConnection *fbconnect = [[JTFacebookConnection alloc] init];
//    [fbconnect setDelegate:self];
//    
//    [fbconnect loginFacebook];
//}
//
//- (void)loginFacebookSuccess:(JTFacebookEntity *)object
//{
//    if(object)
//    {
//        JTLoginService *login = [[JTLoginService alloc] initWithDelegate:self];
//        [login LoginAsFacebookAccount:object.sid andName:object.name andAvata:object.avatar andFacebookAcesstoken:object.accessToken];
//    }
//}
//
//- (void)responseDataSuccessFromService:(NSObject *)object error:(NSError *)error
//{
//    if(!error)
//    {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login success" message:@"Login success" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@"", nil];
//        
//        [alert show];
//        [alert release];
//    }
//    else
//    {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login fail" message:[error valueForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@"", nil];
//        
//        [alert show];
//        [alert release];
//    }
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
