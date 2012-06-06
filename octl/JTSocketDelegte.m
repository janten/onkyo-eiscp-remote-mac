//
//  JTSocketDelegte.m
//  octl
//
//  Created by Jan-Gerd Tenberge on 03.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JTSocketDelegte.h"

@implementation JTSocketDelegte

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port {
    printf("Connected to %s at port %i\n", host.UTF8String, port);
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    printf("Resonse: %s\n", [JTOnkyoHelper commandForData:data].UTF8String);
}

- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag {
    printf("Command sent\n");
}
@end
