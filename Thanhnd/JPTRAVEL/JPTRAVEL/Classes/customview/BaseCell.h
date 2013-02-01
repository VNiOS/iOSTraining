//
//  BaseCell.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/21/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BaseCellDelegate <NSObject>

@optional

@end

@interface BaseCell : UITableViewCell
{
    id<BaseCellDelegate> baseCellDelegate;
}

@property (nonatomic, retain) id<BaseCellDelegate> baseCellDelegate;

-(void) updateContent:(id) objectData;

+ (CGFloat)heightForCellWithPost:(id)dataObject;
@end
