//
//  YBSocketClient.m
//  ProtolBuff
//
//  Created by yunbo on 2017/5/16.
//  Copyright © 2017年 yunbo. All rights reserved.
//

#import "YBSocketClient.h"

@implementation YBSocketClient

GCDAsyncSocket *asyncSocket;

+(YBSocketClient *)Share
{
    static YBSocketClient *manager=nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager=[[YBSocketClient alloc]init];
    });
    return manager;
}

- (id)init
{
    if ((self = [super init]))
    {
        dispatch_queue_t mainQueue = dispatch_get_main_queue();
        // Setup logging framework
        asyncSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:mainQueue];
    }
    return self;
}

- (void)createSocketConnect:(NSString *)hostAddress hostPort:(NSInteger)port{
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    // Setup logging framework
    asyncSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:mainQueue];
    NSError *error = nil;
    if ([asyncSocket connectToHost:@"www.paypal.com" onPort:443 error:&error])
    {
       
    }
}

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port{
    NSLog(@"connnect");
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    
}

@end
