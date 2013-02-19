//
//  Place.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/18/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "BaseEntity.h"

@interface PlaceEntity : BaseEntity
//Id of place
@property (nonatomic,retain) NSString *placeId;
@property (nonatomic,retain) NSString *urlImage;
@property (nonatomic, retain) NSString *name;
@end
