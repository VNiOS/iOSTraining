//
//  Util.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/22/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject
+ (NSString *) append:(id) first, ...;

+ (NSString *)timefrom:(NSDate *)startDate toDate:(NSDate *)date;

+ (CGSize)contentSizewithText:(NSString *)text andConstrainedSize:(CGSize)contrainedSize andFontSize:(CGFloat)fontSize;

+ (CGSize)contentSizewithTextBold:(NSString *)text andConstrainedSize:(CGSize)contrainedSize andFontSize:(CGFloat)fontSize;

+ (float)iosVersion;

+ (NSString *)convertDateToString:(NSDate *)date;

+ (NSDate *)convertStringToDate:(NSString *)string;
@end
