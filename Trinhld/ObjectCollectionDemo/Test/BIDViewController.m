//
//  BIDViewController.m
//  Test
//
//  Created by Trinhld on 1/23/13.
//  Copyright (c) 2013 Trinhld. All rights reserved.
//

#import "BIDViewController.h"

@interface BIDViewController ()

@end

@implementation BIDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    /*==============Block demo============*/
    
    void (^myblock)(int) = ^(int num) {
        int multiplier = 7;
        int result =  num * multiplier ;
        NSLog(@"Result use block demo: %d", result);
    };
    myblock(4);
    
    /*==============Array demo=============*/
    NSArray *keyArray = [[NSArray alloc] initWithObjects:@"IssueDate", @"IssueName", @"IssueIcon", nil];
    NSArray *valueArray = [[NSArray alloc] initWithObjects:[NSDate date], @"Numerology", @"ValueIcon" , nil];
    
    /*==============Dictionary demo=============*/
    //init dictionary
    NSDictionary *dictionaryOne = [NSDictionary dictionaryWithObject:valueArray forKey:keyArray];
    NSDictionary *dictionaryTwo = [[NSDictionary alloc] initWithObjectsAndKeys:[NSDate date], @"IssueDate", @"Numerology", @"IssueName", @"ValueIcon", @"IssueIcon", nil];
    NSDictionary *dictionaryThree = @{
        @"name" : NSUserName(),
        @"date" : [NSDate date],
        @"processInfo" : @"process"
    };
    NSLog(@"Dictionary 2: %@", dictionaryTwo);
    //access an object in a dictionary
    NSDate *getDateFromDictionary = [dictionaryOne objectForKey:@"IssueDate"];
    NSString *myName = dictionaryThree[@"name"];
    NSLog(@"Access an object:-Name: %@ %@", myName, getDateFromDictionary);
    //Mutable dictionary
    NSMutableDictionary *mutableDict = [[NSMutableDictionary alloc] init];
    mutableDict[@"name"] = NSUserName();
    mutableDict[@"company"] = @"LTT";
    NSMutableDictionary *mutableDict2 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:NSUserName(), @"name", @"LTT", @"company", nil];
    [mutableDict2 setObject:@"1m" forKey:@"height"];
    NSLog(@"Dictionary before remove: %@", mutableDict2);
    NSArray *removeArray = [[NSArray alloc] initWithObjects:@"company", @"height", nil];
    [mutableDict2 removeObjectsForKeys:removeArray];
    NSLog(@"Dictionary after remove: %@", mutableDict2);
    for (NSArray *keyInDict in mutableDict2) {
        NSLog(@"Key :%@ , Value: %@", keyInDict, mutableDict2[@"%@", keyInDict]);
    }
    // Compare two dictionaries
    BOOL compare = [mutableDict isEqual:mutableDict2];
    if(compare) {
        NSLog(@"Two dictionary is same");
    } else {
        NSLog(@"Two dictionary is not same");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
