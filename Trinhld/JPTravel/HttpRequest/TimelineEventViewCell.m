//
//  TimelineEventViewCell.m
//  JPTravel
//
//  Created by Trinhld on 2/1/13.
//  Copyright (c) 2013 Trinhld. All rights reserved.
//

#import "TimelineEventViewCell.h"
#import "TimelineEntity.h"
#import "UIImageView+WebCache.h"

@implementation TimelineEventViewCell

@synthesize placeImage, placeName, description, time;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        placeImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 70, 70)];
        placeName = [[UILabel alloc] initWithFrame:CGRectMake(90, 10, 220, 20)];
        
        description =[[UILabel alloc] initWithFrame:CGRectMake(90, 30, 220, 40)];
        [description setFont:[UIFont systemFontOfSize:11]];
        
        time = [[UILabel alloc] initWithFrame:CGRectMake(90, 70, 220, 10)];
        [time setFont:[UIFont systemFontOfSize:11]];
        
        //add sub view
        [self.contentView addSubview:placeImage];
        [self.contentView addSubview:placeName];
        [self.contentView addSubview:description];
        [self.contentView addSubview:time];
    }
    return self;
}

- (void)updateCell:(id)object
{
    TimelineEntity *timeline = (TimelineEntity *)object;
    if (timeline) {
        [self.placeImage setImageWithURL:[NSURL URLWithString:timeline.event.imageUrl] placeholderImage:nil];
        [self.placeName setText:timeline.event.name];
        [self.description setText:timeline.event.description];
        [self.description setNumberOfLines:0];
        NSString *timeDisplay = [NSString stringWithFormat:@"%@ - %@", timeline.event.startTime, timeline.event.endTime];
        [self.time setText:timeDisplay];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
