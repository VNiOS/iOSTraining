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
@implementation PostCell
@synthesize postCellDelegate;
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
        imgPlace = [[UIImageView alloc] initWithFrame:CGRectMake(SZImagePostThumbX, SZImagePostThumbY, SZImagePostThumbWidth, SZImagePostThumbHeight)];
        [self.contentView addSubview:imgPlace];
        
        lblUserName = [[UILabel alloc]initWithFrame:CGRectMake(100, 10, 120, 15)];
        [lblUserName setBackgroundColor:[UIColor clearColor]];
        [lblUserName setFont:[UIFont systemFontOfSize:14]];
        [self.contentView addSubview:lblUserName];
        
        lblDescription = [[UILabel alloc] initWithFrame:CGRectMake(100, 30, 120, 15)];
        [lblDescription setBackgroundColor:[UIColor clearColor]];
        [lblDescription setFont:[UIFont systemFontOfSize:11]];
        lblDescription.numberOfLines = 3;
        [self.contentView addSubview:lblDescription];
        
        lblCommentCount = [[UILabel alloc] initWithFrame:CGRectMake(100, 60, 80, 15)];
        [lblCommentCount setBackgroundColor:[UIColor clearColor]];
        [lblCommentCount setFont:[UIFont systemFontOfSize:11]];
        [self.contentView addSubview:lblCommentCount];
        
        lblBookmarkCount = [[UILabel alloc] initWithFrame:CGRectMake(200, 60, 80, 15)];
        [lblBookmarkCount setBackgroundColor:[UIColor clearColor]];
        [lblBookmarkCount setFont:[UIFont systemFontOfSize:11]];
        [self.contentView addSubview:lblBookmarkCount];
        
        lblPlaceName = [[UILabel alloc] initWithFrame:CGRectMake(100, 75, 120, 15)];
        [lblPlaceName setBackgroundColor:[UIColor clearColor]];
        [lblPlaceName setFont:[UIFont systemFontOfSize:14]];
        [self.contentView addSubview:lblPlaceName];
        
        imgUserAvatar = [[UIImageView alloc] initWithFrame:CGRectMake(260, 15, 50, 50)];
        [self.contentView addSubview:imgUserAvatar];
        
        lblPostedAt = [[UILabel alloc] initWithFrame:CGRectMake(260, 70, 60, 15)];
        [lblPostedAt setBackgroundColor:[UIColor clearColor]];
        [lblPostedAt setFont:[UIFont systemFontOfSize:11]];
        [self.contentView addSubview:lblPostedAt];
        
    }
    return self;
}

-(void) dealloc
{
    [super dealloc];
    [lblBookmarkCount release];
    [lblCommentCount release];
    [lblUserName release];
    [lblDescription release];
    [lblPlaceName release];
    [imgUserAvatar release];
    [imgPlace release];
}

-(void) updateContent:(id)objectData
{
    TimelineEntity *timelineEntity = (TimelineEntity *) objectData;
    if(timelineEntity){
        [imgPlace setImageWithURL:[NSURL URLWithString:timelineEntity.post.postThumbUrl] placeholderImage:[UIImage imageNamed:@"icon.png"]];
        [lblUserName setText:timelineEntity.user.userName];
        [lblDescription setText:timelineEntity.post.description];
        [lblCommentCount setText:[NSString stringWithFormat:@"%d comments",timelineEntity.post.commentCount]];
        [lblBookmarkCount setText:[NSString stringWithFormat:@"%d likes",timelineEntity.post.bookmarkCount]];
        [lblPlaceName setText:timelineEntity.post.placeName];
        [imgUserAvatar setImageWithURL:[NSURL URLWithString:timelineEntity.user.userAvatar] placeholderImage:[UIImage imageNamed:@"icon.png"]];
        [lblPostedAt setText:timelineEntity.post.postedAt];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
