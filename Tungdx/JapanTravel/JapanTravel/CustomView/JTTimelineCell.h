//
//  JTTimelineCell.h
//  JapanTravel
//
//  Created by Xuan Tung on 1/22/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IMAGE_LARGE 70
#define IMAGE_THUMB 40
#define IMAGE_OFFSET 10
#define TEXT_OFFSET 1
#define COMMENT_OFFSET 20
#define COMMENT_COUNT_HEIGHT 15

#define TEXT_HEIGHT 20
#define TEXT_SIZE_LARGE 14
#define TEXT_SIZE_SMALL 11


#define TAG_COMMENT_COUNT 101
#define TAG_BOOKMARK_COUNT 102
#define TAG_AVATAR 103
#define TAG_TIME_POST 104

@class JTImageView;
@interface JTTimelineCell : UITableViewCell
{
    BOOL _isEvent;
    
    JTImageView *_thumbImage;
    UILabel *_placeName;
    UILabel *_comment;
    UILabel *_atPlace;
    
    UIButton *_commentNumber;
    UIButton *_bookmarkNumber;
    UILabel *_timePost;
    JTImageView *_userAvatar;


}

@property (nonatomic, retain) JTImageView *thumbImage;
@property (nonatomic, retain) UILabel *placeName;
@property (nonatomic, retain) UILabel *comment;
@property (nonatomic, retain) UILabel *atPlace;
@property (nonatomic, retain) UIButton *commentNumber;
@property (nonatomic, retain) UIButton *bookmarkNumber;
@property (nonatomic, retain) UILabel *timePost;
@property (nonatomic, retain) JTImageView *userAvatar;

@property (nonatomic, assign) BOOL isEvent;

- (void)fillDataCellfromObject:(NSObject *)object;
+ (CGFloat)cellHeight:(NSObject *)object;
@end
