//
//  JTAppDelegate.h
//  JapanTravel
//
//  Created by Xuan Tung on 1/21/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JTViewController;
@class JTTimeLineViewController;

@interface JTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) JTViewController *viewController;

@property (strong, nonatomic) JTTimeLineViewController *timelineController;
@end
