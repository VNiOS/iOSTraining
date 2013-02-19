//
//  LTTCellView.m
//  JPTravel
//
//  Created by Trinhld on 1/30/13.
//  Copyright (c) 2013 Trinhld. All rights reserved.
//

#import "LTTCellView.h"
#import "UIImageView+WebCache.h"

@implementation LTTCellView

@synthesize imageView;
@synthesize nameLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        [self.contentView addSubview:imageView];
        
        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 20, 200, 20)];
        [self.contentView addSubview:nameLabel];
    }
    return self;
}

- (void) initImageView: (NSURL *)urlImage
{
    UIImage *holderImage = [UIImage imageNamed:@"loading18.gif"];
    [self.imageView setImageWithURL:urlImage placeholderImage:holderImage];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
