//
//  JsonParser.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/18/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonParser : NSObject
- (NSMutableArray *) getListPlace:(NSDictionary *) dict;
- (NSMutableArray *) getListTimeline:(NSDictionary *) dict;
@end
