//
//  DataLoader.h
//  Demo
//
//  Created by Ted Li on 12-7-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface DataLoader : NSObject

@property (strong, nonatomic) ViewController *delegate;
- (void)loadData;

@end
