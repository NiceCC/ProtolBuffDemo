//
//  ViewController.m
//  ProtolBuff
//
//  Created by yunbo on 2017/5/15.
//  Copyright © 2017年 yunbo. All rights reserved.
//

#import "ViewController.h"
#import "PersonDemo.pbobjc.h"
#import "YBSocketClient.h"
#import "User.pbobjc.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person *person = [[Person alloc] init];
    person.age = 100;
    NSData *pdata = [person data];
    Person *p = [Person parseFromData:pdata error:nil];
    NSLog(@"person:%@",p);

    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"dat"];
    NSData *data = [NSData dataWithContentsOfFile:dataPath];
    //获取指定长度的data
    NSData *data1 = [data subdataWithRange:NSMakeRange(0,4)];
    
    //从第8位开始后15结束
    NSData *data3 = [data subdataWithRange:NSMakeRange(8,15)];
    //NSString *string = [[NSString alloc] initWithData:data1 encoding:NSUTF8StringEncoding];

    Byte byte[4];
    [data getBytes:byte range:NSMakeRange(0, 4)];

    //int转bytes
    int value = 2222;
    Byte byte1[4] = {};
    byte1[0] =  (Byte) ((value>>24) & 0xFF);
    byte1[1] =  (Byte) ((value>>16) & 0xFF);
    byte1[2] =  (Byte) ((value>>8) & 0xFF);
    byte1[3] =  (Byte) (value & 0xFF);
    
    NSString *hexStr=@"";
    Byte *bytes = (Byte *)[data1 bytes];
    for(int i=0;i<[data1 length];i++)
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        if([newHexStr length]==1)
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    
    unsigned int hex;
    [[NSScanner scannerWithString:hexStr] scanHexInt:&hex];
    
    NSLog(@"bytes 的16进制数为:%@",hexStr);

    User *user = [User parseFromData:data3 error:nil];
    NSLog(@"person:%@",user);

    //socket测试
    YBSocketClient *client = [YBSocketClient Share];
    [client createSocketConnect:@"" hostPort:0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
