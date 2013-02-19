//
//
//  JapanTravel
//
//  Created by Xuan Tung on 1/25/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JTSocialNetworkEntity.h"
#import "JTJsonParseDelegate.h"

@interface JTFacebookEntity : JTSocialNetworkEntity <JTJsonParseDelegate>
{

}
@property (nonatomic ,retain) NSString *name;
@property (nonatomic, retain) NSString *avatar;


- (id)initWithDictionary:(NSDictionary *)dic;
@end
