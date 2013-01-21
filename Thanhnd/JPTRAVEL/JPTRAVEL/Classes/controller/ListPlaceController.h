//
//  ListPlaceController.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/17/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface ListPlaceController : BaseViewController<UITableViewDelegate, UITableViewDataSource>{
    
}
@property (nonatomic, retain) IBOutlet UITableView *tableViewPlaces;;

@end
