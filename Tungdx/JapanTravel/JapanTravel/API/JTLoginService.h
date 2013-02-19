//
//  JTLoginService.h
//  JapanTravel
//
//  Created by Xuan Tung on 1/24/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JTBaseService.h"
#import "SBJson.h"
#import "JTLoginJsonParse.h"
@interface JTLoginService : JTBaseService<ASIHTTPRequestDelegate,JTJsonParseDelegate>
{
    
}
- (id)initWithDelegate:(id<JTBaseServiceDelegate>)delegate;

- (void)LoginAsFacebookAccount:(NSString *)facebookId andName:(NSString *)name andAvata:(NSString *)avatar andFacebookAcesstoken:(NSString *)fbAcessToken;
@end
