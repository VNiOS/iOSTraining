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
@end
