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
        imgPlace = [[UIImageView alloc] initWithFrame:CGRectMake(SZImagePostThumbX, SZImagePostThumbY, SZImagePostThumbWidth, SZImagePostThumbHeight)];
        [self.contentView addSubview:imgPlace];
        
        lblPlaceName = [[UILabel alloc]initWithFrame:CGRectMake(SZPlaceNameEventNameX, SZPlaceNameEventNameY, SZPlaceNameEventNameWidth, SZPlaceNameEventNameHeight)];
        [lblPlaceName setBackgroundColor:[UIColor clearColor]];
        [lblPlaceName setFont:[UIFont systemFontOfSize:14]];
        [self.contentView addSubview:lblPlaceName];
        
        lblDescription = [[UILabel alloc] initWithFrame:CGRectMake(SZDescriptionX, SZDescriptionY, SZDescriptionWidth, SZDescriptionHeight)];
        [lblDescription setBackgroundColor:[UIColor clearColor]];
        [lblDescription setFont:[UIFont systemFontOfSize:11]];
        lblDescription.numberOfLines = 0;
        [self.contentView addSubview:lblDescription];
        
        lblTime = [[UILabel alloc] initWithFrame:CGRectMake(SZTimeX, SZTimeY, SZTimeWidth, SZTimeHeight)];
        [lblTime setBackgroundColor:[UIColor clearColor]];
        [lblTime setFont:[UIFont systemFontOfSize:11]];
        [self.contentView addSubview:lblTime];
        
    }
    return self;
}

-(void) updateContent:(id)objectData
{
    TimelineEntity *timelineEntity = (TimelineEntity *) objectData;
    if (timelineEntity) {
        [imgPlace setImageWithURL:[NSURL URLWithString:timelineEntity.event.imageUrl] placeholderImage:[UIImage imageNamed:@"icon.png"]];
        [lblPlaceName setText:timelineEntity.event.name];
        [lblDescription setText:timelineEntity.event.description];
        [lblTime setText:[NSString stringWithFormat:@"Time: %@ - %@",timelineEntity.event.startTime,timelineEntity.event.endTime]];
    }
}
-(void)dealloc
{
    [super dealloc];
    [imgPlace release];
    [lblDescription release];
    [lblPlaceName release];
    [lblTime release];
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
