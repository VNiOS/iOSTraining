//
//  BaseViewController.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/21/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKRefreshControl/CKRefreshControl.h"
#import "BaseApiService.h"
@interface BaseViewController : UIViewController
@property (nonatomic, retain) BaseApiService *baseApiService;

-(void) didFinishSelector:(BaseApiService *) response;
-(void) didFailSelector:(BaseApiService *) response;
@end
