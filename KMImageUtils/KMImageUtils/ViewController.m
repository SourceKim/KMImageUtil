////  ViewController.m
//  KMImageUtils
//
//  Created by Su Jinjin on 2020/5/9.
//  Copyright © 2020 苏金劲. All rights reserved.
//

#import "ViewController.h"

#import "KMImageUtils/KMImageUtilsHeaders.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *img = [UIImage imageNamed: @"test0.jpeg"];
    
    CVBufferRef buf = [KMConverter KM_CGImage_To_CVPixelBuffer: img.CGImage];
    
    CGImageRef imgR = [KMConverter KM_CVPixelBuffer_To_CGImage: buf];
    
    NSLog(@"fin");
    
}


@end
