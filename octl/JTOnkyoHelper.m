//
//  JTOnkyoHelper.m
//  octl
//
//  Created by Jan-Gerd Tenberge on 03.06.12.
//  Copyright (c) 2012 Jan-Gerd Tenberge. All rights reserved.
//

#import "JTOnkyoHelper.h"
#include <libkern/OSByteOrder.h>

@implementation JTOnkyoHelper

+ (NSData *)dataForCommand:(NSString*)command {
    NSMutableData *data = [NSMutableData data];
    const char prequel[4] = "ISCP";
    uint32_t headerSize =  OSSwapInt32(16);
    uint32_t commandSize = OSSwapInt32(command.length);
    uint32_t iscpVersion = OSSwapInt32(0x01000000);
    char endCommand = {0x0D};
    
    [data appendBytes:&prequel length:sizeof(prequel)];
    [data appendBytes:&headerSize length:sizeof(int32_t)];
    [data appendBytes:&commandSize length:sizeof(int32_t)];   
    [data appendBytes:&iscpVersion length:sizeof(int32_t)];
    [data appendData:[command dataUsingEncoding:NSASCIIStringEncoding]];
    [data appendBytes:&endCommand length:sizeof(char)];
    
    return data;
}

+ (NSString *)commandForData:(NSData *)data {
    uint32_t sizeOfData = 0;
    [data getBytes:&sizeOfData range:NSMakeRange(8, 4)];
    sizeOfData = OSSwapInt32(sizeOfData);
    void *command = malloc(sizeOfData);
    [data getBytes:command range:NSMakeRange(16, sizeOfData)];
    NSString *response = [NSString stringWithCString:command encoding:NSASCIIStringEncoding];
    response = [response substringToIndex:[response rangeOfString:@"\r"].location-1];
    return response;
}

@end
