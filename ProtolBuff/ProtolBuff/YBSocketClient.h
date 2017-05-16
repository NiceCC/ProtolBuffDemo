//
//  YBSocketClient.h
//  ProtolBuff
//
//  Created by yunbo on 2017/5/16.
//  Copyright © 2017年 yunbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"

@interface YBSocketClient : NSObject<GCDAsyncSocketDelegate>

+(YBSocketClient *)Share;
- (void)createSocketConnect:(NSString *)hostAddress hostPort:(NSInteger)port;

@end
