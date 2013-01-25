//
//  JTCommonUltils.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/22/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "JTCommonUltils.h"
#import "UIImageView+WebCache.h"

@implementation JTCommonUltils

+ (NSString *)timefrom:(NSDate *)startDate toDate:(NSDate *)date;
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger unitFlags = NSWeekCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *component = [gregorian components:unitFlags fromDate:startDate toDate:date options:0];
    
    NSInteger second = [component second];
    
    NSInteger minute = [component minute];
    
    NSInteger hour = [component hour];
    
    NSInteger day = [component day];
    
    NSInteger week = [component week];

    
    if(week>0)
        return [NSString stringWithFormat:@"%d weeks ago",week];
    if(day>0)
        return [NSString stringWithFormat:@"%d days ago",day];
    if(hour>0)
        return [NSString stringWithFormat:@"%d hours ago",hour];
    if(minute>0)
        return [NSString stringWithFormat:@"%d minutes ago",minute];
    
    return [NSString stringWithFormat:@"%d seconds ago",second];
}

+ (CGSize)contentSizewithText:(NSString *)text andConstrainedSize:(CGSize)contrainedSize andFontSize:(CGFloat)fontSize
{
    if([text isKindOfClass:[NSNull class]])
        return CGSizeMake(0, 0);
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:contrainedSize lineBreakMode:UILineBreakModeWordWrap];
    return size;
}

+ (CGSize)contentSizewithTextBold:(NSString *)text andConstrainedSize:(CGSize)contrainedSize andFontSize:(CGFloat)fontSize
{
    if([text isKindOfClass:[NSNull class]])
        return CGSizeMake(0, 0);
    CGSize size = [text sizeWithFont:[UIFont boldSystemFontOfSize:fontSize] constrainedToSize:contrainedSize lineBreakMode:UILineBreakModeWordWrap];
    return size;
}

+ (float)iosVersion
{
    return [[UIDevice currentDevice].systemVersion floatValue];
}

+ (NSDate *)convertStringToDate:(NSString *)string
{
    NSDateFormatter *dateFormat = [[[NSDateFormatter alloc]init] autorelease];
    [dateFormat setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
    return [dateFormat dateFromString:string];
}

+ (NSString *)convertDateToString:(NSDate *)date
{
    NSDateFormatter *dateFormat = [[[NSDateFormatter alloc]init] autorelease];
    [dateFormat setDateFormat:@"yyyy/MM/dd"];
    return [dateFormat stringFromDate:date];
}
@end
