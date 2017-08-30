//
//  ViewController.m
//  SDWebImage-Analysis
//
//  Created by 开不了口的猫 on 2017/8/5.
//  Copyright © 2017年 TDF. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
    dispatch_queue_t q = dispatch_queue_create("szy", DISPATCH_QUEUE_SERIAL);
    dispatch_async(q, ^{
        usleep(1000);
        NSLog(@"%@执行的代码", [NSThread currentThread]);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"转回主线程执行的代码");
        });
    });
    NSLog(@"主线程的代码");
}


@end
