//
//  EventCustomCell.m
//  JPTRAVEL
//
//  Created by Thanhnd on 1/22/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "EventCustomCell.h"
#import "CommonSizes.h"
#import "TimelineEntity.h"
#import "UIImageView+WebCache.h"
@implementation EventCustomCell
@synthesize timelineEntity;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        imgPlace = [[UIImageView alloc] init];
        [self.contentView addSubview:imgPlace];
        
        lblPlaceName = [[UILabel alloc]init];
        [lblPlaceName setBackgroundColor:[UIColor clearColor]];
        [lblPlaceName setFont:[UIFont systemFontOfSize:14]];
        [self.contentView addSubview:lblPlaceName];
        
        lblDescription = [[UILabel alloc] init];
        [lblDescription setBackgroundColor:[UIColor clearColor]];
        [lblDescription setFont:[UIFont systemFontOfSize:11]];
        lblDescription.numberOfLines = 0;
        [self.contentView addSubview:lblDescription];
        
        lblTime = [[UILabel alloc] init];
        [lblTime setBackgroundColor:[UIColor clearColor]];
        [lblTime setFont:[UIFont systemFontOfSize:11]];
        [self.contentView addSubview:lblTime];
        
    }
    return self;
}

+(CGFloat)heightForCellWithData:(id)dataObject
{
    TimelineEntity *timelineEntity = (TimelineEntity *) dataObject;
    CGSize sizeToFit = [timelineEntity.event.description sizeWithFont:[UIFont systemFontOfSize:11.0f] constrainedToSize:CGSizeMake(170.0f, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
    
    return fmaxf(90.0f, sizeToFit.height + 40.0f);
}
-(void) layoutSubviews
{
    [super layoutSubviews];
    imgPlace.frame = CGRectMake(10.0f, 10.0f, 70.0f, 70.0f);
    lblPlaceName.frame = CGRectMake(90.0f, 10.0f, 220.0f, 15.0f);
    CGRect descTextFrame = CGRectOffset(lblPlaceName.frame, 0.0f, 10.0f);
    descTextFrame.size.height = [[self class] heightForCellWithData:timelineEntity] - 40.0f;
    lblDescription.frame = descTextFrame;
    float OFFSET = descTextFrame.size.height - 60.0f;
    lblTime.frame = CGRectMake(90.0f, 73.0f + OFFSET, 220.0f, 10.0f);
}

-(void) updateContent:(id)dataObject
{
    timelineEntity = (TimelineEntity *) dataObject;
    if (timelineEntity) {
        [imgPlace setImageWithURL:[NSURL URLWithString:timelineEntity.event.imageUrl] placeholderImage:[UIImage imageNamed:@"icon.png"]];
        [lblPlaceName setText:timelineEntity.event.name];
        [lblDescription setText:timelineEntity.event.description];
        [lblTime setText:[NSString stringWithFormat:@"Time: %@ - %@",timelineEntity.event.startTime,timelineEntity.event.endTime]];
    }
    [super setNeedsLayout];
}
-(void)dealloc
{
    [super dealloc];
    [timelineEntity release];
    [imgPlace release];
    [lblDescription release];
    [lblPlaceName release];
    [lblTime release];
}


@end
