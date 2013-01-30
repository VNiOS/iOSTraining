//
//  TimelineService.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/22/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "BaseApiService.h"

FOUNDATION_EXPORT NSString * const SVTimeline;

@interface TimelineService : BaseApiService
-(void) getListTimeline:(int)offset;
@end
