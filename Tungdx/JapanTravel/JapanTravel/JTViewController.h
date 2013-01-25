//
//  JTViewController.h
//  JapanTravel
//
//  Created by Xuan Tung on 1/21/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SBJsonStreamParser;
@class SBJsonStreamParserAdapter;
@interface JTViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableview;
    NSMutableArray *_listPlace;

    SBJsonStreamParser *paser;
    SBJsonStreamParserAdapter *adapter;
}

@property (nonatomic, retain) UITableView *tableview;
@property (nonatomic, retain) NSMutableArray *listPlace;
@end
