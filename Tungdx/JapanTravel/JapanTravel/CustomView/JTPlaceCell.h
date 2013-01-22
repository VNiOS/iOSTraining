//
//  JTPlaceCell.h
//  JapanTravel
//
//  Created by Xuan Tung on 1/21/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JTImageView;
@interface JTPlaceCell : UITableViewCell
{
    JTImageView *_placeImage;
    UILabel *_placeName;
}

@property (nonatomic, retain) JTImageView *placeImage;
@property (nonatomic, retain) UILabel *placeName;
@end
