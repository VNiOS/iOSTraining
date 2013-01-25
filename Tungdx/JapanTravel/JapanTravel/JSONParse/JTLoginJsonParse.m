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
    if([success isEqualToString:@"success"])
    {
        NSDictionary *dic = [dict objectForKey:@"data"];
        if(![dic isKindOfClass:[NSNull class]])
        {
            if(self.tag== LOGIN_API_TAG)
            {
                UserEntity *entity = [[UserEntity alloc] initwithDictionary:[dic objectForKey:@"user"]];
                if(entity)
                {
                    if(self.delegate)
                        [self.delegate parseDataSuccess:entity withTag:LOGIN_API_TAG error:nil];
                }
                else
                {
                    NSError *error = [[NSError alloc] init];
                    [error setValue:dic forKey:@"error"];
                    if(self.delegate)
                        [self.delegate parseDataSuccess:entity withTag:LOGIN_API_TAG error:error];
                }
            }
        }
        else
        {

        }
    }
    else // status: error
    {
        if(self.tag== LOGIN_API_TAG)
        {
            if(self.delegate)
            {
                NSError *error = [[NSError alloc] init];
                [error setValue:[dict objectForKey:@"message"] forKey:@"error"];
                if(self.delegate)
                    [self.delegate parseDataSuccess:nil withTag:LOGIN_API_TAG error:error];
            }
        }
    }
}

- (void)parserLoginAPI:(NSDictionary *)dic
{
    
}

@end
