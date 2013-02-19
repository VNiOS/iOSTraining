//
//  LTTCellView.h
//  JPTravel
//
//  Created by Trinhld on 1/30/13.
//  Copyright (c) 2013 Trinhld. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTTCellView : UITableViewCell

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *nameLabel;


- (void) initImageView: (NSURL *)urlImage;

@end
