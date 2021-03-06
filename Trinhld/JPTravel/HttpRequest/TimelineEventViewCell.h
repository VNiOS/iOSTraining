//
//  TimelineEventViewCell.h
//  JPTravel
//
//  Created by Trinhld on 2/1/13.
//  Copyright (c) 2013 Trinhld. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimelineEventViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView *placeImage;
@property (strong, nonatomic) UILabel *placeName;
@property (strong, nonatomic) UILabel *description;
@property (strong, nonatomic) UILabel *time;

- (void)updateCell:(id)object;

@end
