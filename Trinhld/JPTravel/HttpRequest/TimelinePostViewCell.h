//
//  TimelinePostViewCell.h
//  JPTravel
//
//  Created by Trinhld on 2/1/13.
//  Copyright (c) 2013 Trinhld. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimelinePostViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView *placeImage;
@property (strong, nonatomic) UILabel *userName;
@property (strong, nonatomic) UILabel *description;
@property (strong, nonatomic) UILabel *commentCount;
@property (strong, nonatomic) UILabel *bookmarkCount;
@property (strong, nonatomic) UILabel *placeName;
@property (strong, nonatomic) UIImageView *userAvatar;
@property (strong, nonatomic) UILabel *postAt;

- (void)updateCell:(id)object;

@end
