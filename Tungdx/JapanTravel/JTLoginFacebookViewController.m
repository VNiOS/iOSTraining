//
//  JTLoginFacebookViewController.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/24/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "JTLoginFacebookViewController.h"
#import "UserEntity.h"

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
    if([self fetchData])
    {
        UserEntity *user = [self fetchData];
        NSLog(@"access token: %@",user.accessToken);
        UILabel *lblAccessToken = [[UILabel alloc] initWithFrame:CGRectMake(30, 210, 260, 40)];
        [lblAccessToken setLineBreakMode:UILineBreakModeCharacterWrap];
        [lblAccessToken setNumberOfLines:0];
        [lblAccessToken setText:user.accessToken];
        [lblAccessToken setFont:[UIFont systemFontOfSize:12.0f]];
        [lblAccessToken setTextColor:[UIColor blackColor]];
        [self.view addSubview:lblAccessToken];
        [lblAccessToken release];
    }
    else
    {
        UIButton *buttonFacebookLogin = [[UIButton alloc] initWithFrame:CGRectMake(30, 210, 260, 40)];
        [buttonFacebookLogin setBackgroundImage:[UIImage imageNamed:@"silver-button-normal.png"] forState:UIControlStateNormal];
        [buttonFacebookLogin.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
        [buttonFacebookLogin setTitle:@"Login as Facebook Account" forState:UIControlStateNormal];
        [buttonFacebookLogin setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [buttonFacebookLogin addTarget:self action:@selector(loginFacebook) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:buttonFacebookLogin];
        [buttonFacebookLogin release];
    }
}

- (void)loginFacebook
{
    JTFacebookConnection *fbconnect = [[JTFacebookConnection alloc] init];
    [fbconnect setDelegate:self];
    
    [fbconnect loginFacebook];
}

- (void)loginFacebookSuccess:(JTFacebookEntity *)object
{
    if(object)
    {
        JTLoginService *login = [[JTLoginService alloc] initWithDelegate:self];
        [login LoginAsFacebookAccount:object.sid andName:object.name andAvata:object.avatar andFacebookAcesstoken:object.accessToken];
    }
}

- (void)responseDataSuccessFromService:(NSObject *)object error:(BaseResponseEntity *)error
{
    if(!error)
    {
        UserEntity *user = (UserEntity *)object;
        [self storeData:user];
        NSLog(@"access token: %@",user.accessToken);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login success" message:@"Login success" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        [alert release];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login fail" message:error.message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        [alert release];
    }
}

- (void)storeData:(UserEntity *)user
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:user.userId forKey:@"id"];
    [defaults setObject:user.username forKey:@"name"];
    [defaults setObject:user.facebookId forKey:@"facebook_id"];
    [defaults setObject:user.facebookAccessToken forKey:@"facebook_access_token"];
    [defaults setObject:user.accessToken forKey:@"access_token"];
    [defaults setObject:user.avatar forKey:@"avatar"];
    [defaults setObject:user.createdAt forKey:@"created_at"];
    [defaults setObject:user.updateAt forKey:@"updated_at"];
    [defaults setBool:user.deleted forKey:@"deleted"];
    [defaults synchronize];
}


- (UserEntity *)fetchData
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *accesstoken = [defaults objectForKey:@"access_token"];
    if(!accesstoken)
        return nil;
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:accesstoken forKey:@"access_token"];
    [dic setObject:[defaults objectForKey:@"id"] forKey:@"id"];
    [dic setObject:[defaults objectForKey:@"name"] forKey:@"name"];
    [dic setObject:[defaults objectForKey:@"facebook_id"] forKey:@"facebook_id"];
    [dic setObject:[defaults objectForKey:@"facebook_access_token"] forKey:@"facebook_access_token"];
    [dic setObject:[defaults objectForKey:@"avatar"] forKey:@"avatar"];
    [dic setObject:[defaults objectForKey:@"created_at"] forKey:@"created_at"];
    [dic setObject:[defaults objectForKey:@"updated_at"] forKey:@"updated_at"];
    [dic setObject:[defaults objectForKey:@"deleted"] forKey:@"deleted"];
    
    UserEntity *user = [[UserEntity alloc] initwithDictionary:dic];
    return user;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
