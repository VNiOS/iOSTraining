//
//  JTImageView.h
//  JapanTravel
//
//  Created by Xuan Tung on 1/21/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JTImageView : UIButton
{
    NSString *_photoId;
}
@property (nonatomic, retain) NSString *photoId;

- (void)loadImageFromUrl:(NSURL *)url;
@end
