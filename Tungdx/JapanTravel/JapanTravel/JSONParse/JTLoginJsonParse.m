//
//  JTLoginJsonParse.m
//  JapanTravel
//
//  Created by Xuan Tung on 1/24/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "JTLoginJsonParse.h"
#import "UserEntity.h"
#import "JTBaseService.h"

@implementation JTLoginJsonParse

- (id)initwithTag:(int)tag andDelegate:(id<JTJsonParseDelegate>)delegate
{
    self = [super initWithDelegate:self];
    if(self)
    {
        self.tag = tag;
        self.delegate = delegate;
    }
    return self;
}



- (void)parser:(SBJsonStreamParser *)parser foundArray:(NSArray *)array
{
    
}

- (void)parser:(SBJsonStreamParser *)parser foundObject:(NSDictionary *)dict
{
    NSString *success = [dict objectForKey:@"status"];
    if([success isEqualToString:@"error"])
    {
        BaseResponseEntity *error = [[BaseResponseEntity alloc]init];
        error.message = [dict objectForKey:@"message"];
        
        if(self.delegate)
            [self.delegate parseDataSuccess:nil withTag:LOGIN_API_TAG error:error];
    }
    else
    {
        if(self.tag == LOGIN_API_TAG)
            [self parserLoginAPI:dict];
    }
}

- (void)parserLoginAPI:(NSDictionary *)dict
{
    NSString *success = [dict objectForKey:@"status"];
    if([success isEqualToString:@"success"])
    {
        NSDictionary *dic = [dict objectForKey:@"data"];
        if(![dic isKindOfClass:[NSNull class]])
        {
            UserEntity *entity = [[UserEntity alloc] initwithDictionary:[dic objectForKey:@"user"]];
            if(entity)
            {
                if(self.delegate)
                    [self.delegate parseDataSuccess:entity withTag:LOGIN_API_TAG error:nil];
            }
        }
    }
    else if([success isEqualToString:@"fail"])
    {
        BaseResponseEntity *error = [[BaseResponseEntity alloc]init];
        error.message = @"";
        if ([[dict objectForKey:@"data"] objectForKey:@"facebook_id"]) {
            error.message = @"facebook_id can't be blank";
        }
        if([[dict objectForKey:@"data"] objectForKey:@"facebook_id"])
        {
            error.message = [NSString stringWithFormat:@"%@, %@",error.message,@"name can't be blank"];
        }
        if(self.delegate)
            [self.delegate parseDataSuccess:nil withTag:LOGIN_API_TAG error:error];
    }
}

@end
