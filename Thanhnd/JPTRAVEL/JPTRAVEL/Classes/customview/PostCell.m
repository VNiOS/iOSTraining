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
        imgUserAvatar = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
        [self.contentView addSubview:imgUserAvatar];
    }
    return self;
}

-(void) dealloc
{
    [super dealloc];
    [imgUserAvatar release];
}

-(void) updateContent:(id)objectData
{
    TimelineEntity *timelineEntity = (TimelineEntity *) objectData;
    if(timelineEntity){
        [imgUserAvatar setImageWithURL:[NSURL URLWithString:timelineEntity.user.userAvatar] placeholderImage:[UIImage imageNamed:@"icon.png"]];
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
