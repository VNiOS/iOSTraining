//
//  PlaceService.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/25/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "BaseApiService.h"
FOUNDATION_EXPORT NSString * const SVPlace;
@interface PlaceService : BaseApiService
-(void) getListPlace:(NSString *) areaId withOffset:(NSInteger) offset;
@end
