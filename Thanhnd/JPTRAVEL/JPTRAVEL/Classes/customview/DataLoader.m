//
//  DataLoader.m
//  Demo
//
//  Created by Ted Li on 12-7-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DataLoader.h"

@implementation DataLoader

@synthesize delegate;

- (void)loadData
{
    [self performSelector:@selector(loadDataDelayed) withObject:nil afterDelay:3];
}

- (void)loadDataDelayed
{
    delegate.fetchBatch ++;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:30];
    for (int i = 1; i<=30 ; i++) {
        [array addObject:[NSString stringWithFormat:@"Batch No.:%d, Item No.:%d",delegate.fetchBatch,i]];
    }
    [delegate.searchResultOfSets addObjectsFromArray:array];
    [delegate.tableView reloadData];
    // Always remember to set loading to NO whenever you finish loading the data.
    delegate.loading = NO;
}

@end
