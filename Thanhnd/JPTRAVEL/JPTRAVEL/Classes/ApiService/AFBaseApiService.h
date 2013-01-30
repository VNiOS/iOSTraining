//
//  AFBaseApiService.h
//  JPTRAVEL
//
//  Created by Thanhnd on 1/29/13.
//  Copyright (c) 2013 Thanhnd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceDelegate.h"
#import "ServiceConfig.h"

@interface AFBaseApiService : NSObject{
    id <ServiceDelegate> delegate;
    SEL didFinishSelector;
    SEL didFailedSelector;
    NSDictionary *dictData;
    NSMutableArray *arrayData;
    NSInteger tag;
    
}

#pragma mark - DECLARE PROPERTY

@property (nonatomic, retain) NSDictionary *dictData;
@property (nonatomic, retain) NSMutableArray *arrayData;

@property (assign, nonatomic) id delegate;
@property (assign) SEL didFinishSelector;
@property (assign) SEL didFailedSelector;
@property (assign) NSInteger tag;
#pragma mark - DECLARE METHOD
//INIT
-(id) init;
//When API have only Group Name and using method HTTP Get
-(void) buildRequestGetGroup:(NSString *)groupName withParams:(NSDictionary *)params;
//When API have only Group Name and using method HTTP Post
-(void) buildRequestPostGroup:(NSString *)groupName withParams:(NSDictionary *)params;
//When API have Group Name and Method Name using method HTTP Get
-(void) buildRequestGetGroup:(NSString *)groupName methodName:(NSString *) methodName withParams:(NSDictionary *)params;
//When API have Group Name and Method Name using method HTTP Post
-(void) buildRequestPostGroup:(NSString *)groupName methodName:(NSString *) methodName withParams:(NSDictionary *)params;
//This method call back when received data (data in property dictData)
-(void) buildData;

@end
