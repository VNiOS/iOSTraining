//
//  PostCell.m
//  JPTRAVEL
//
//  Created by Thanhnd on 1/21/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "PostCell.h"
#import "TimelineEntity.h"
#import "UIImageView+WebCache.h"
#import "CommonSizes.h"
#import "Util.h"

@implementation PostCell
@synthesize postCellDelegate;
@synthesize timelineEntity;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        imgPlace = [[UIImageView alloc] init];
        [self.contentView addSubview:imgPlace];
        
        lblUserName = [[UILabel alloc]init];
        [lblUserName setBackgroundColor:[UIColor clearColor]];
        [lblUserName setFont:[UIFont systemFontOfSize:14]];
        [self.contentView addSubview:lblUserName];
        
        lblDescription = [[UILabel alloc] init];
        [lblDescription setBackgroundColor:[UIColor clearColor]];
        [lblDescription setFont:[UIFont systemFontOfSize:11]];
        lblDescription.numberOfLines = 0;
        [self.contentView addSubview:lblDescription];
        
        lblCommentCount = [[UILabel alloc] init];
        [lblCommentCount setBackgroundColor:[UIColor clearColor]];
        [lblCommentCount setFont:[UIFont systemFontOfSize:11]];
        [self.contentView addSubview:lblCommentCount];

        lblBookmarkCount = [[UILabel alloc] init];
        [lblBookmarkCount setBackgroundColor:[UIColor clearColor]];
        [lblBookmarkCount setFont:[UIFont systemFontOfSize:11]];
        [self.contentView addSubview:lblBookmarkCount];

        lblPlaceName = [[UILabel alloc] init];
        [lblPlaceName setBackgroundColor:[UIColor clearColor]];
        [lblPlaceName setFont:[UIFont systemFontOfSize:14]];
        [self.contentView addSubview:lblPlaceName];

        imgUserAvatar = [[UIImageView alloc] init];
        [self.contentView addSubview:imgUserAvatar];
        
        lblPostedAt = [[UILabel alloc] init];
        [lblPostedAt setFont:[UIFont systemFontOfSize:10]];
        [self.contentView addSubview:lblPostedAt];
        
    }
    return self;
}

-(void) dealloc
{
    [super dealloc];
    [timelineEntity release];
    [lblBookmarkCount release];
    [lblCommentCount release];
    [lblUserName release];
    [lblDescription release];
    [lblPlaceName release];
    [imgUserAvatar release];
    [imgPlace release];
}
+ (CGFloat)heightForCellWithData:(id)objectData {
    TimelineEntity *timelineEntity = (TimelineEntity *) objectData;
    CGSize sizeToFit = [timelineEntity.post.description sizeWithFont:[UIFont systemFontOfSize:11.0f] constrainedToSize:CGSizeMake(170.0f, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
    
    return fmaxf(90.0f, sizeToFit.height + 70.0f);
}

-(void) layoutSubviews
{
    [super layoutSubviews];
    
    imgPlace.frame = CGRectMake(10.0f, 10.0f, 70.0f, 70.0f);
    
    lblUserName.frame = CGRectMake(90.0f, 10.0f, 170.0f, 15.0f);
    CGRect descTextFrame = CGRectOffset(lblUserName.frame, 0.0f, 20.0f);
    descTextFrame.size.height = [[self class] heightForCellWithData:timelineEntity] - 70.0f;
    lblDescription.frame = descTextFrame;
    float OFFSET = descTextFrame.size.height - 20.0f;
    lblCommentCount.frame = CGRectMake(90.0f, 60.0f + OFFSET, 70.0f, 10.0f);
    lblBookmarkCount.frame = CGRectMake(180.0f, 60.0f + OFFSET, 70.0f, 10.0f);
    lblPlaceName.frame = CGRectMake(90.0f, 73.0f + OFFSET, 170.0f, 10.0f);
    
    imgUserAvatar.frame = CGRectMake(270.0f, 10.0f, 40.0f, 40.0f);
    lblPostedAt.frame = CGRectMake(265.0f, 60.0f, 50.0f, 10.0f);
}

-(void) updateContent:(id)objectData
{
    timelineEntity = (TimelineEntity *) objectData;
    if(timelineEntity){
        [imgPlace setImageWithURL:[NSURL URLWithString:timelineEntity.post.postThumbUrl] placeholderImage:[UIImage imageNamed:@"icon.png"]];
        lblUserName.text = timelineEntity.user.userName;
        lblDescription.text = timelineEntity.post.description;
        lblCommentCount.text = [NSString stringWithFormat:@"Comment %d",timelineEntity.post.commentCount];
        
        lblBookmarkCount.text = [NSString stringWithFormat:@"Bookmark %d",timelineEntity.post.bookmarkCount];
        lblPlaceName.text = [NSString stringWithFormat:@"at: %@",timelineEntity.post.placeName];
        [imgUserAvatar setImageWithURL:[NSURL URLWithString:timelineEntity.user.userAvatar] placeholderImage:[UIImage imageNamed:@"icon.png"]];
        lblPostedAt.text = timelineEntity.post.postedAt;
        
    }
    [super setNeedsLayout];
}
@end
