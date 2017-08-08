//
//  ViewController.m
//  AFNetworking-Analysis
//
//  Created by 开不了口的猫 on 2017/8/3.
//  Copyright © 2017年 TDF. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self nativeRequest];
}

- (void)nativeRequest {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:@"http://10.1.132.140:8081/jFinalDemo/"]];
    request.HTTPMethod = @"POST";
    NSString *query = @"id=123&name=oufen";
    request.HTTPBody = [query dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil]);
        } else {
            NSLog(@"%@", error);
        }
    }];
    [task resume];
}

@end
