//
//  JTTimelineCell.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/22/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "JTTimelineCell.h"
#import "JTImageView.h"
#import "PostingEntity.h"
#import "EventEntity.h"
#import "JTCommonUltils.h"

@implementation JTTimelineCell
@synthesize thumbImage=_thumbImage,placeName=_placeName,comment=_comment,commentNumber=_commentNumber,description=_description,bookmarkNumber=_bookmarkNumber, timePost=_timePost,userAvatar=_userAvatar,isEvent=_isEvent;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    self.thumbImage = [[JTImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    
    self.placeName = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 150, 20)];
    [self.placeName setBackgroundColor:[UIColor clearColor]];
    [self.placeName setFont:[UIFont boldSystemFontOfSize:16]];

    
    self.comment = [[UILabel alloc] init];
    [self.commentNumber setBackgroundColor:[UIColor clearColor]];
    [self.comment setLineBreakMode:NSLineBreakByWordWrapping];
    
    self.commentNumber = [[UIButton alloc] init];
    [self.commentNumber setBackgroundColor:[UIColor clearColor]];
    [self.commentNumber setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.commentNumber.titleLabel setFont:[UIFont systemFontOfSize:14]];
    
    self.bookmarkNumber = [[UIButton alloc] init];
    [self.bookmarkNumber setBackgroundColor:[UIColor clearColor]];
    [self.bookmarkNumber setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.bookmarkNumber.titleLabel setFont:[UIFont systemFontOfSize:14]];
    
    self.userAvatar = [[JTImageView alloc] init];
    
    self.description = [[UILabel alloc] init];
    [self.description setFont:[UIFont systemFontOfSize:14]];
    [self.description setBackgroundColor:[UIColor clearColor]];
    
    self.timePost = [[UILabel alloc] init];
    [self.timePost setBackgroundColor:[UIColor clearColor]];

}

- (void)fillDataCellfromObject:(NSObject *)object
{
    if([object isKindOfClass:[PostingEntity class]])
    {
        self.isEvent = NO;
        PostingEntity *postingObject = (PostingEntity *)object;
        [self.thumbImage loadImageFromUrl:[NSURL URLWithString:postingObject.postThumbUrl]];
        self.thumbImage.photoId = postingObject.postId;
        [self.contentView addSubview:self.thumbImage];
        
        [self.placeName setText:postingObject.username];
        [self.contentView addSubview:self.placeName];
        
        CGSize commentContentSize = [JTCommonUltils contentSizewithText:postingObject.description andConstrainedSize:CGSizeMake(150, 1000) andFontSize:14];
        [self.comment setFrame:CGRectMake(100, 35, 150, commentContentSize.height)];
        if(![postingObject.description isKindOfClass:[NSNull class]])
            [self.comment setText:postingObject.description];
        [self.contentView addSubview:self.comment];
        
        NSString *commentCount = [NSString stringWithFormat:@"%d comment",postingObject.commentCount];
        CGSize commnentCountSize = [JTCommonUltils contentSizewithText:commentCount andConstrainedSize:CGSizeMake(100, 20) andFontSize:14];
        [self.commentNumber setFrame:CGRectMake(100, 35+commentContentSize.height, commnentCountSize.width, 20)];
        NSLog(@"%f",self.commentNumber.frame.size.width);
        [self.commentNumber setTitle:commentCount forState:UIControlStateNormal];
        [self.contentView addSubview:self.commentNumber];
        
        NSString *bookmarkCount = [NSString stringWithFormat:@"%d likes",postingObject.bookmarkCount];
        CGSize bookmarkCountSize = [JTCommonUltils contentSizewithText:bookmarkCount andConstrainedSize:CGSizeMake(100, 20) andFontSize:14];
        [self.bookmarkNumber setFrame:CGRectMake(100+commnentCountSize.width+10, 35+commentContentSize.height, bookmarkCountSize.width , 20)];
        [self.bookmarkNumber setTitle:bookmarkCount forState:UIControlStateNormal];
        [self.contentView addSubview:self.bookmarkNumber];
        
        [self.timePost setFont:[UIFont boldSystemFontOfSize:16]];
        NSString *place = [NSString stringWithFormat:@"At: %@",postingObject.placeName];
        [self.timePost setFrame:CGRectMake(100, 35+commentContentSize.height+20, 150, 20)];
        [self.timePost setText:place];
        [self.contentView addSubview:self.timePost];
        
        [self.userAvatar setFrame:CGRectMake(320-70, 10, 50, 50)];
        [self.userAvatar setImage:[UIImage imageNamed:@"noAvatar.png"] forState:UIControlStateNormal];
        [self.userAvatar loadImageFromUrl:[NSURL URLWithString:postingObject.postThumbUrl]];
        [self.contentView addSubview:self.userAvatar];
    }
    else if([object isKindOfClass:[EventEntity class]])
    {
        self.isEvent = YES;
        EventEntity *eventObject = (EventEntity *)object;
        [self.thumbImage loadImageFromUrl:[NSURL URLWithString:eventObject.imageUrl]];
        self.thumbImage.photoId = eventObject.eventId;
        [self.contentView addSubview:self.thumbImage];
        
        [self.placeName setText:eventObject.eventName];
        [self.contentView addSubview:self.placeName];
        
        CGSize descriptionContentSize = [JTCommonUltils contentSizewithText:eventObject.description andConstrainedSize:CGSizeMake(150, 1000) andFontSize:14];
        [self.comment setFrame:CGRectMake(100, 35, 200, descriptionContentSize.height)];
        [self.contentView addSubview:self.comment];

        [self.timePost setFont:[UIFont systemFontOfSize:14]];
        NSString *time = [NSString stringWithFormat:@"Time: %@ - %@",eventObject.startTime,eventObject.endTime];
        [self.timePost setFrame:CGRectMake(100, 10+descriptionContentSize.height+10, 200, 20)];
        [self.timePost setText:time];
        [self.contentView addSubview:self.timePost];
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
