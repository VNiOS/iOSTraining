//
//  TimelinePostViewCell.m
//  JPTravel
//
//  Created by Trinhld on 2/1/13.
//  Copyright (c) 2013 Trinhld. All rights reserved.
//

#import "TimelinePostViewCell.h"
#import "TimelineEntity.h"
#import "UIImageView+WebCache.h"

@implementation TimelinePostViewCell

@synthesize placeImage, placeName, description, commentCount, bookmarkCount, postAt, userAvatar, userName;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        placeImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 70, 70)];
        userName = [[UILabel alloc] initWithFrame:CGRectMake(90, 10, 170, 20)];
        description = [[UILabel alloc] initWithFrame:CGRectMake(90, 30, 170, 30)];
        [description setFont:[UIFont systemFontOfSize:11]];
        commentCount = [[UILabel alloc] initWithFrame:CGRectMake(90, 60, 80, 20)];
        [commentCount setFont:[UIFont systemFontOfSize:12]];
        bookmarkCount = [[UILabel alloc] initWithFrame:CGRectMake(180, 60, 80, 20)];
        [bookmarkCount setFont:[UIFont systemFontOfSize:12]];
        placeName = [[UILabel alloc] initWithFrame:CGRectMake(90, 90, 170, 20)];
        [placeName setFont:[UIFont systemFontOfSize:11]];   
        userAvatar = [[UIImageView alloc] initWithFrame:CGRectMake(270, 10, 40, 40)];
        postAt = [[UILabel alloc] initWithFrame:CGRectMake(270, 60, 40, 20)];
        [postAt setFont:[UIFont systemFontOfSize:9]];
        
        //add subview
        [self.contentView addSubview:placeImage];
        [self.contentView addSubview:userName];
        [self.contentView addSubview:description];
        [self.contentView addSubview:commentCount];
        [self.contentView addSubview:bookmarkCount];	
        [self.contentView addSubview:placeName];
        [self.contentView addSubview:userAvatar];
        [self.contentView addSubview:postAt];
    }
    return self;
}

- (void)updateCell:(id)object
{
    TimelineEntity *timeline = (TimelineEntity *)object;
    if (timeline) {
        [self.placeImage setImageWithURL:[NSURL URLWithString:timeline.post.postThumbUrl] placeholderImage:nil];
        [self.userName setText:timeline.user.userName];
        [self.description setText:timeline.post.description];
        [self.commentCount setText:[NSString stringWithFormat:@"Comment : %@", timeline.post.commentCount]];
        [self.bookmarkCount setText:[NSString stringWithFormat:@"Bookmark : %@", timeline.post.bookmarkCount]];
        [self.placeName setText:[NSString stringWithFormat:@"At: %@", timeline.post.placeName]];
        [self.userAvatar setImageWithURL:[NSURL URLWithString:timeline.post.postThumbUrl] placeholderImage:nil];
        [self.postAt setText:timeline.post.postAt];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
