//
//  JTImageView.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/21/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "JTImageView.h"
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
    [self.imageView setImageWithURL:url placeholderImage:[UIImage imageNamed:@"noAvatar.png"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
        if(!error)
        {
            [self setImage:image forState:UIControlStateNormal];
        }
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
