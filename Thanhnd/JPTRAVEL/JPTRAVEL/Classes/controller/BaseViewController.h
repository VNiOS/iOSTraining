//
//  BaseViewController.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/21/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKRefreshControl/CKRefreshControl.h"
@interface BaseViewController : UIViewController
-(void) doRefresh:(CKRefreshControl *)sender;
@end
