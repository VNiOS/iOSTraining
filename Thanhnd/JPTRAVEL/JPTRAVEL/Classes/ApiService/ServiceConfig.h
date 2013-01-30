//
//  ServiceConfig.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/29/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import <Foundation/Foundation.h>


#ifndef SV_DEBUG_LOG
#define SV_DEBUG_LOG NSLog
#endif

//When set to 1 SERVICE will print all information
#ifndef DEBUG_SERVICE
#define DEBUG_SERVICE 0
#endif

#ifndef SERVER_API_ADDRESS
#define SERVER_API_ADDRESS "http://api.japantravel.icapps.co/"
#endif

#ifndef API_TIMELINE
#define API_TIMELINE "timeline"
#endif

FOUNDATION_EXPORT NSString * const SVApiServerAddress;

FOUNDATION_EXPORT NSString * const SVOffset;
FOUNDATION_EXPORT NSString * const SVLimitKey;
FOUNDATION_EXPORT NSInteger const SVLimitValue;

@interface ServiceConfig : NSObject

@end
