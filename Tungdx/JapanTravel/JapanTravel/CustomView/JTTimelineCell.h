//
//  JTTimelineCell.h
//  JapanTravel
//
//  Created by Xuan Tung on 1/22/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JTImageView;
@interface JTTimelineCell : UITableViewCell
{
    BOOL _isEvent;
    
    JTImageView *_thumbImage;
    UILabel *_placeName;
    UILabel *_comment;
    UILabel *_description;
    
    UIButton *_commentNumber;
    UIButton *_bookmarkNumber;
    UILabel *_timePost;
    JTImageView *_userAvatar;

}

@property (nonatomic, retain) JTImageView *thumbImage;
@property (nonatomic, retain) UILabel *placeName;
@property (nonatomic, retain) UILabel *comment;
@property (nonatomic, retain) UILabel *description;
@property (nonatomic, retain) UIButton *commentNumber;
@property (nonatomic, retain) UIButton *bookmarkNumber;
@property (nonatomic, retain) UILabel *timePost;
@property (nonatomic, retain) JTImageView *userAvatar;

@property (nonatomic, assign) BOOL isEvent;

- (void)fillDataCellfromObject:(NSObject *)object;
@end
