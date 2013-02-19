//
//  JTLoginJsonParse.h
//  JapanTravel
//
//  Created by Xuan Tung on 1/24/13.
//  Copyright (c) 2013 Xuan Tung. All rights reserved.
//

#import "JTJsonParseBase.h"
#import "JTJsonParseDelegate.h"

@interface JTLoginJsonParse : JTJsonParseBase <SBJsonStreamParserAdapterDelegate>


- (id)initwithTag:(int)tag andDelegate:(id<JTJsonParseDelegate>)delegate;
@end
