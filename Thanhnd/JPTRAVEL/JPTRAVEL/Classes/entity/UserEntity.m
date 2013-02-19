//
//  UserEntity.m
//  JPTRAVEL
//
//  Created by Thanhnd on 1/21/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import "UserEntity.h"

@implementation UserEntity
@synthesize userAvatar,userName;


-(id) initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    if (self) {
        
        if(dict){
            if([dict valueForKey:@"user_avatar"] != (id)[NSNull null] && [[dict valueForKey:@"user_avatar"] length] != 0){
                self.userAvatar = [dict objectForKey:@"user_avatar"];
            }
            if([dict valueForKey:@"user_name"] != (id)[NSNull null] && [[dict valueForKey:@"user_name"] length] != 0){
                self.userName = [dict objectForKey:@"user_name"];
            }
        }
    }
    
    return self;
}

@end
