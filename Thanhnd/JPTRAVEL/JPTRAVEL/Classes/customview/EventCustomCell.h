//
//  EventCustomCell.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/22/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "BaseCell.h"
#import "TimelineEntity.h"
@interface EventCustomCell : BaseCell
{
    UIImageView *imgPlace;
    UILabel *lblPlaceName;
    UILabel *lblDescription;
    UILabel *lblTime;
}
@property (nonatomic, strong) TimelineEntity *timelineEntity;
@end
