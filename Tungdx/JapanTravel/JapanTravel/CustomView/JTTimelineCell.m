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
@synthesize thumbImage=_thumbImage,placeName=_placeName,comment=_comment,commentNumber=_commentNumber,atPlace=_atPlace,bookmarkNumber=_bookmarkNumber, timePost=_timePost,userAvatar=_userAvatar,isEvent=_isEvent;

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
    self.thumbImage = [[JTImageView alloc] initWithFrame:CGRectMake(IMAGE_OFFSET, IMAGE_OFFSET, IMAGE_LARGE, IMAGE_LARGE)];
    
    self.placeName = [[UILabel alloc] init];
    [self.placeName setBackgroundColor:[UIColor clearColor]];
    [self.placeName setFont:[UIFont boldSystemFontOfSize:TEXT_SIZE_LARGE]];

    
    self.comment = [[UILabel alloc] init];
    [self.comment setBackgroundColor:[UIColor clearColor]];
    [self.comment setLineBreakMode:UILineBreakModeWordWrap];
    
    self.commentNumber = [[UIButton alloc] init];
    [self.commentNumber setBackgroundColor:[UIColor clearColor]];
    [self.commentNumber setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.commentNumber.titleLabel setFont:[UIFont systemFontOfSize:TEXT_SIZE_SMALL]];
    
    self.bookmarkNumber = [[UIButton alloc] init];
    [self.bookmarkNumber setBackgroundColor:[UIColor clearColor]];
    [self.bookmarkNumber setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.bookmarkNumber.titleLabel setFont:[UIFont systemFontOfSize:TEXT_SIZE_SMALL]];
    
    self.userAvatar = [[JTImageView alloc] init];
    
    self.atPlace = [[UILabel alloc] init];
    [self.atPlace setBackgroundColor:[UIColor clearColor]];
    
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
//        [self.thumbImage setContentMode:UIViewContentModeCenter];
        [self.contentView addSubview:self.thumbImage];
        
        CGSize placeContentSize = [JTCommonUltils contentSizewithTextBold:postingObject.username andConstrainedSize:CGSizeMake(150, 1000) andFontSize:TEXT_SIZE_LARGE];
        [self.placeName setFrame:CGRectMake(IMAGE_LARGE+IMAGE_OFFSET*2, IMAGE_OFFSET, 150, placeContentSize.height)];
        [self.placeName setText:postingObject.username];
        [self.placeName setContentMode:UIViewContentModeTopLeft];
        [self.contentView addSubview:self.placeName];
        
        CGSize commentContentSize = [JTCommonUltils contentSizewithText:postingObject.description andConstrainedSize:CGSizeMake(150, 1000) andFontSize:TEXT_SIZE_LARGE];
        [self.comment setFrame:CGRectMake(IMAGE_LARGE+IMAGE_OFFSET*2, IMAGE_OFFSET+placeContentSize.height+TEXT_OFFSET, 150, commentContentSize.height)];
        [self.comment setFont:[UIFont systemFontOfSize:TEXT_SIZE_LARGE]];
        [self.comment setNumberOfLines:0];
        if(![postingObject.description isKindOfClass:[NSNull class]])
            [self.comment setText:postingObject.description];
        [self.contentView addSubview:self.comment];
        
        NSString *commentCount = [NSString stringWithFormat:@"%d comment",postingObject.commentCount];
        CGSize commnentCountSize = [JTCommonUltils contentSizewithText:commentCount andConstrainedSize:CGSizeMake(100, 20) andFontSize:TEXT_SIZE_SMALL];
        if(commentContentSize.height>0)
            [self.commentNumber setFrame:CGRectMake(IMAGE_LARGE+IMAGE_OFFSET*2,IMAGE_OFFSET+placeContentSize.height+TEXT_OFFSET+commentContentSize.height+COMMENT_OFFSET,commnentCountSize.width , COMMENT_COUNT_HEIGHT)];
        else
            [self.commentNumber setFrame:CGRectMake(IMAGE_LARGE+IMAGE_OFFSET*2,IMAGE_OFFSET+placeContentSize.height+COMMENT_OFFSET,commnentCountSize.width , COMMENT_COUNT_HEIGHT)];
        
        [self.commentNumber.titleLabel setFont:[UIFont systemFontOfSize:TEXT_SIZE_SMALL]];
        [self.commentNumber setTitle:commentCount forState:UIControlStateNormal];
        [self.commentNumber setTag:TAG_COMMENT_COUNT];
        [self.contentView addSubview:self.commentNumber];
        
        NSString *bookmarkCount = [NSString stringWithFormat:@"%d likes",postingObject.bookmarkCount];
        CGSize bookmarkCountSize = [JTCommonUltils contentSizewithText:bookmarkCount andConstrainedSize:CGSizeMake(100, 20) andFontSize:TEXT_SIZE_SMALL];
        if(commentContentSize.height>0)
            [self.bookmarkNumber setFrame:CGRectMake(IMAGE_LARGE+IMAGE_OFFSET*2+commnentCountSize.width+COMMENT_OFFSET,IMAGE_OFFSET+placeContentSize.height+TEXT_OFFSET+commentContentSize.height+COMMENT_OFFSET,bookmarkCountSize.width , COMMENT_COUNT_HEIGHT)];
        else
            [self.bookmarkNumber setFrame:CGRectMake(IMAGE_LARGE+IMAGE_OFFSET*2+commnentCountSize.width+COMMENT_OFFSET, IMAGE_OFFSET+placeContentSize.height+COMMENT_OFFSET,bookmarkCountSize.width , COMMENT_COUNT_HEIGHT)];
        [self.bookmarkNumber.titleLabel setFont:[UIFont systemFontOfSize:TEXT_SIZE_SMALL]];
        [self.bookmarkNumber setTitle:bookmarkCount forState:UIControlStateNormal];
        [self.bookmarkNumber setTag:TAG_BOOKMARK_COUNT];
        [self.contentView addSubview:self.bookmarkNumber];
        
        [self.atPlace setFont:[UIFont boldSystemFontOfSize:TEXT_SIZE_SMALL]];
        NSString *place = [NSString stringWithFormat:@"@%@",postingObject.placeName];
        if(commentContentSize.height>0)
            [self.atPlace setFrame:CGRectMake(IMAGE_LARGE+IMAGE_OFFSET*2, IMAGE_OFFSET+placeContentSize.height+TEXT_OFFSET+commentContentSize.height+COMMENT_OFFSET+COMMENT_COUNT_HEIGHT+TEXT_OFFSET,150 , COMMENT_COUNT_HEIGHT)];
        else
            [self.atPlace setFrame:CGRectMake(IMAGE_LARGE+IMAGE_OFFSET*2, IMAGE_OFFSET+placeContentSize.height+COMMENT_OFFSET+COMMENT_COUNT_HEIGHT+TEXT_OFFSET,150 , COMMENT_COUNT_HEIGHT)];
        [self.atPlace setText:place];
        [self.contentView addSubview:self.atPlace];
        
        [self.userAvatar setFrame:CGRectMake(320-IMAGE_THUMB-IMAGE_OFFSET, IMAGE_OFFSET, IMAGE_THUMB, IMAGE_THUMB)];
        [self.userAvatar loadImageFromUrl:[NSURL URLWithString:postingObject.postThumbUrl]];
        [self.userAvatar setTag:TAG_AVATAR];
        [self.contentView addSubview:self.userAvatar];
        
        NSDate *now = [NSDate date];
        [self.timePost setFont:[UIFont systemFontOfSize:11]];
        CGSize timePostSize = [JTCommonUltils contentSizewithText:[JTCommonUltils timefrom:[JTCommonUltils convertStringToDate:postingObject.timePost] toDate:now] andConstrainedSize:CGSizeMake(100, 20) andFontSize:11];
        [self.timePost setFrame:CGRectMake(320-timePostSize.width, IMAGE_OFFSET+IMAGE_THUMB+TEXT_OFFSET+5, timePostSize.width, 15)];
        [self.timePost setTag:TAG_TIME_POST];
                [self.timePost setText:[JTCommonUltils timefrom:[JTCommonUltils convertStringToDate:postingObject.timePost] toDate:now]];
        [self.contentView addSubview:self.timePost];
    
    }
    else if([object isKindOfClass:[EventEntity class]])
    {
        self.isEvent = YES;
        
        if([self.contentView viewWithTag:TAG_COMMENT_COUNT])
            [[self.contentView viewWithTag:TAG_COMMENT_COUNT] removeFromSuperview];
        
        if([self.contentView viewWithTag:TAG_BOOKMARK_COUNT])
            [[self.contentView viewWithTag:TAG_BOOKMARK_COUNT] removeFromSuperview];
        
        if([self.contentView viewWithTag:TAG_AVATAR])
            [[self.contentView viewWithTag:TAG_AVATAR] removeFromSuperview];
        
        if([self.contentView viewWithTag:TAG_TIME_POST])
            [[self.contentView viewWithTag:TAG_TIME_POST] removeFromSuperview];
        
        EventEntity *eventObject = (EventEntity *)object;
        [self.thumbImage loadImageFromUrl:[NSURL URLWithString:eventObject.imageUrl]];
        self.thumbImage.photoId = eventObject.eventId;
        [self.contentView addSubview:self.thumbImage];
        
        [self.placeName setText:eventObject.eventName];
        CGSize placeContentSize = [JTCommonUltils contentSizewithTextBold:eventObject.eventName andConstrainedSize:CGSizeMake(200, 1000) andFontSize:TEXT_SIZE_LARGE];
        [self.placeName setFrame:CGRectMake(IMAGE_LARGE+IMAGE_OFFSET*2, IMAGE_OFFSET, 200, placeContentSize.height)];
        [self.contentView addSubview:self.placeName];
        
        CGSize commentContentSize = [JTCommonUltils contentSizewithText:eventObject.eventDescription andConstrainedSize:CGSizeMake(200, 1000) andFontSize:TEXT_SIZE_LARGE];
        [self.comment setFrame:CGRectMake(IMAGE_LARGE+IMAGE_OFFSET*2, IMAGE_OFFSET+placeContentSize.height+TEXT_OFFSET, 200, commentContentSize.height)];
        [self.comment setFont:[UIFont systemFontOfSize:TEXT_SIZE_LARGE]];
        [self.comment setLineBreakMode:UILineBreakModeWordWrap];
        [self.comment setNumberOfLines:0];
        [self.comment setText:eventObject.eventDescription];
        [self.contentView addSubview:self.comment];

        [self.atPlace setFont:[UIFont systemFontOfSize:TEXT_SIZE_SMALL]];
        NSString *startTime =[JTCommonUltils convertDateToString:[JTCommonUltils convertStringToDate:eventObject.startTime]];
        NSString *endTime =[JTCommonUltils convertDateToString:[JTCommonUltils convertStringToDate:eventObject.endTime]];
        NSString *time = [NSString stringWithFormat:@"Time: %@ - %@",startTime,endTime];
        if(commentContentSize.height>0)
            [self.atPlace setFrame:CGRectMake(IMAGE_LARGE+IMAGE_OFFSET*2, IMAGE_OFFSET+placeContentSize.height+TEXT_OFFSET+commentContentSize.height+COMMENT_OFFSET, 200, TEXT_HEIGHT)];
        else
             [self.atPlace setFrame:CGRectMake(IMAGE_LARGE+IMAGE_OFFSET*2, IMAGE_OFFSET+placeContentSize.height+COMMENT_OFFSET, 200, TEXT_HEIGHT)];
        [self.atPlace setText:time];
        [self.contentView addSubview:self.atPlace];

    }
}

+ (CGFloat)cellHeight:(NSObject *)object
{
    float minHeight = IMAGE_LARGE+2*IMAGE_OFFSET;
    float height = 0.0;
    if([object isKindOfClass:[PostingEntity class]])
    {
        PostingEntity *postingObject = (PostingEntity *)object;
        
        CGSize placeContentSize = [JTCommonUltils contentSizewithTextBold:postingObject.username andConstrainedSize:CGSizeMake(150, 1000) andFontSize:TEXT_SIZE_LARGE];
        
        CGSize commentContentSize = [JTCommonUltils contentSizewithText:postingObject.description andConstrainedSize:CGSizeMake(150, 1000) andFontSize:TEXT_SIZE_LARGE];
        if(commentContentSize.height>0)
        {
            height = IMAGE_OFFSET + placeContentSize.height+ TEXT_OFFSET + commentContentSize.height + COMMENT_OFFSET + COMMENT_COUNT_HEIGHT +TEXT_OFFSET + COMMENT_COUNT_HEIGHT + IMAGE_OFFSET;
        }
        else
        {
            height = IMAGE_OFFSET + placeContentSize.height + TEXT_OFFSET + COMMENT_COUNT_HEIGHT +TEXT_OFFSET + COMMENT_COUNT_HEIGHT + IMAGE_OFFSET;
        }
        return height > minHeight ? height : minHeight;
    }
    else if([object isKindOfClass:[EventEntity class]])
    {
        EventEntity *eventObject = (EventEntity *)object;
        CGSize commentContentSize = [JTCommonUltils contentSizewithText:eventObject.eventDescription andConstrainedSize:CGSizeMake(200, 1000) andFontSize:TEXT_SIZE_LARGE];
        CGSize placeContentSize = [JTCommonUltils contentSizewithTextBold:eventObject.eventName andConstrainedSize:CGSizeMake(200, 1000) andFontSize:TEXT_SIZE_LARGE];
        if(commentContentSize.height>0)
        {
            height = IMAGE_OFFSET + placeContentSize.height + TEXT_OFFSET + commentContentSize.height + COMMENT_OFFSET + TEXT_HEIGHT + IMAGE_OFFSET;
        }
        else
        {
            height = IMAGE_OFFSET + placeContentSize.height + TEXT_OFFSET  + TEXT_HEIGHT + IMAGE_OFFSET;
        }
    
        return height > minHeight ? height : minHeight;
    }
    return minHeight;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
