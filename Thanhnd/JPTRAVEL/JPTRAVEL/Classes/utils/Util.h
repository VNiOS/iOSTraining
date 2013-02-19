//
//  Util.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/22/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import <Foundation/Foundation.h>
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface Util : NSObject
+ (NSString *) append:(id) first, ...;

+ (NSString *)timefrom:(NSDate *)startDate toDate:(NSDate *)date;

+ (CGSize)contentSizewithText:(NSString *)text andConstrainedSize:(CGSize)contrainedSize andFontSize:(CGFloat)fontSize;

+ (CGSize)contentSizewithTextBold:(NSString *)text andConstrainedSize:(CGSize)contrainedSize andFontSize:(CGFloat)fontSize;

+ (float)iosVersion;

+ (NSString *)convertDateToString:(NSDate *)date;

+ (NSDate *)convertStringToDate:(NSString *)string;

+(NSString *) formatDateWithString:(NSString *) string;

+(NSString *) formatDateRangeStart:(NSString *) start end:(NSString *) end;
@end
