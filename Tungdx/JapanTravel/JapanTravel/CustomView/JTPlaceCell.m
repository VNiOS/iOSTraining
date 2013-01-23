//
//  JTPlaceCell.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/21/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "JTPlaceCell.h"
#import "JTImageView.h"

@implementation JTPlaceCell
@synthesize placeImage=_placeImage, placeName=_placeName;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self initView];
    }
    return self;
}

- (void)initView
{
    self.placeImage = [[JTImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
//    [self.placeImage addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.placeImage];
    
    self.placeName = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 200, 100)];
    [self.contentView addSubview:self.placeName];
}

- (IBAction)buttonClick:(id)sender
{

}

- (void)dealloc
{
    [super dealloc];
    [self.placeImage release];
    [self.placeName release];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
