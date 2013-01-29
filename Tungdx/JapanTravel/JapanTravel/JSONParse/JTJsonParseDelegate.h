//
//  JTJsonParseDelegate.h
//  JapanTravel
//
//  Created by Xuan Tung on 1/24/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseResponseEntity.h"

@protocol JTJsonParseDelegate <NSObject>
@optional
- (void)parseDataSuccess:(NSObject *)object withTag:(int)tag error:(BaseResponseEntity *)error;
@end
