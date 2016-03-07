//
//  ViewController.m
//  LearnNSURLSession
//
//  Created by 林伟池 on 16/3/6.
//  Copyright © 2016年 林伟池. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic , strong) IBOutlet UIImageView* imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self testUrl];
}

- (void)testFileInDisk {
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"ios_url" ofType:@"png"];
    NSURL* url = [NSURL fileURLWithPath:path];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //        NSLog(@"data %@", [data description]);
        NSLog(@"response %@", [response description]);
        NSLog(@"error %@", [error description]);
        UIImage* image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.imageView setImage:image];
        });
    }] resume];
}

- (void)testUrl {
    NSURL* url = [NSURL URLWithString:@"http://www.baidu.com/"]; //这里和https的不同
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        NSLog(@"string %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        NSLog(@"response %@", [response description]);
        NSLog(@"error %@", [error description]);
        UIImage* image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.imageView setImage:image];
        });
    }] resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
