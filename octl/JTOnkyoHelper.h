//
//  JTOnkyoHelper.h
//  octl
//
//  Created by Jan-Gerd Tenberge on 03.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JTOnkyoHelper : NSObject

+ (NSData *)dataForCommand:(NSString*)command;
+ (NSString *)commandForData:(NSData *)data;

@end
