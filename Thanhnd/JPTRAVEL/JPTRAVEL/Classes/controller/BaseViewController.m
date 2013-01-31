//
//  BaseViewController.m
//  JPTRAVEL
//
//  Created by Thanhnd on 1/21/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
@synthesize baseApiService;

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
	// Do any additional setup after loading the view.
}

-(void) didFinishSelector:(BaseApiService *) response
{
    
}

-(void) didFailSelector:(BaseApiService *)response
{

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
