//
//  JTImageView.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/21/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//
#import <CoreGraphics/CoreGraphics.h>
#import "JTImageView.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"
@implementation JTImageView
@synthesize photoId=_photoId;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)loadImageFromUrl:(NSURL *)url
{
//    [self setImageWithURL:url forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"noAvatar.png"]];
//    [self setImageWithURL:url placeholderImage:[UIImage imageNamed:@"noAvatar.png"]];
    [self setImageWithURL:url placeholderImage:[UIImage imageNamed:@"noAvatar.png"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
        
        CGImageRef imageRef;
        if(image.size.height>image.size.width)
            imageRef= CGImageCreateWithImageInRect([image CGImage], CGRectMake(0,(image.size.height-image.size.width)/2,image.size.width,image.size.width));
        else
            imageRef= CGImageCreateWithImageInRect([image CGImage], CGRectMake((image.size.width-image.size.height)/2,0,image.size.height,image.size.height));
        [self setImage:[UIImage imageWithCGImage:imageRef]];
        CGImageRelease(imageRef);
    }];
}

- (void)dealloc
{
    [super dealloc];
    [self.photoId release];
    self.photoId = nil;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
