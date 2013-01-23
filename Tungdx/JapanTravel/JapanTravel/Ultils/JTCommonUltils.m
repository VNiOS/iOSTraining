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

+ (void)time:(NSDate *)date
{
    
}

+ (CGSize)contentSizewithText:(NSString *)text andConstrainedSize:(CGSize)contrainedSize andFontSize:(CGFloat)fontSize
{
    if([text isKindOfClass:[NSNull class]])
        return CGSizeMake(0, 0);
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:contrainedSize lineBreakMode:UILineBreakModeWordWrap];
    return size;
}

@end
