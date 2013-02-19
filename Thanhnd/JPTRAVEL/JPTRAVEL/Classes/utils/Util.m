//
//  Util.m
//  JPTRAVEL
//
//  Created by Thanhnd on 1/22/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "Util.h"
@implementation Util

+ (NSString *) append:(id) first, ...
{
    NSString * result = @"";
    id eachArg;
    va_list alist;
    if(first)
    {
    	result = [result stringByAppendingString:first];
    	va_start(alist, first);
        eachArg = va_arg(alist, id);
    	while (eachArg)
        {
    		result = [result stringByAppendingString:eachArg];
            eachArg = va_arg(alist, id);
        }
    	va_end(alist);
    }
    return result;
}

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

+(NSString *) formatDateWithString:(NSString *) string
{
    NSDate *date = [[self class] convertStringToDate:string];
    return [[self class] convertDateToString:date];
}
+(NSString *) formatDateRangeStart:(NSString *) start end:(NSString *) end
{
    NSDate *startDate = [[self class] convertStringToDate:start];
    NSDate *endDate = [NSDate date];
    if(end){
        endDate = [[self class] convertStringToDate:end];
    }
    return [[self class] timefrom:startDate toDate:endDate];
}
@end
