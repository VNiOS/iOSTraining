//
//  BaseTableViewController.m
//  JPTRAVEL
//
//  Created by Thanhnd on 2/1/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "BaseTableViewController.h"
#import "TestTableViewController.h"
@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

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
    TestTableViewController *tableViewController = [[TestTableViewController alloc] init];
    tableViewController.enableRefreshHeader = YES;
    [self.view addSubview:tableViewController.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
