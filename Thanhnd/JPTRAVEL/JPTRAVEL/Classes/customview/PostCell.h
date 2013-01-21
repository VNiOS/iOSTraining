//
//  PostCell.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/21/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "BaseCell.h"
@protocol PostCellDelegate <NSObject>

@optional
- (void) loadMoreData;
- (void) btnUsernameClicked:(NSString *) userId;
- (void) btnImageClicked:(NSString *) photoId;

@end
@interface PostCell : BaseCell{
    UIImageView *imgUserAvatar;
    UIImageView *imgPlace;
    UILabel *lblUserName;
    UILabel *lblDescription;
    UILabel *lblCommentCount;
    UILabel *lblBookmarkCount;
    UILabel *lblPlaceName;
    UILabel *lblPostedAt;
    
    //Delegate
    id<PostCellDelegate> postCellDelegate;
}

@property (nonatomic, retain)  id<PostCellDelegate> postCellDelegate;
@end
