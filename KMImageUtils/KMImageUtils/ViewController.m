////  ViewController.m
//  KMImageUtils
//
//  Created by Su Jinjin on 2020/5/9.
//  Copyright © 2020 苏金劲. All rights reserved.
//

#import "ViewController.h"

#import "KMImageUtils/KMImageUtilsHeaders.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView * imgv;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imgv = [[UIImageView alloc] initWithFrame: self.view.bounds];
    
    UIImage *img = [UIImage imageNamed: @"test0.jpeg"];
    
    CVBufferRef buf = [KMConverter KM_CGImage_To_CVPixelBuffer: img.CGImage];
    
    CGImageRef imgR = [KMConverter KM_CVPixelBuffer_To_CGImage: buf];
    
    void *rawData = [KMConverter KM_CVPixelBuffer_To_RawData: buf];
    CVPixelBufferRef backBuf = [KMConverter KM_RawData_To_CVPixelBuffer: rawData width: img.size.width height: img.size.height];
    
    
    CGImageRef cgImg = img.CGImage;
    void *cgRawData = [KMConverter KM_CGImageRef_To_RawData: cgImg];
    CGImageRef backCGImage = [KMConverter KM_RawData_To_CGImageRef: cgRawData width: CGImageGetWidth(cgImg) height: CGImageGetHeight(cgImg)];
    UIImage *backUIImg = [UIImage imageWithCGImage: backCGImage];
    
    
    NSLog(@"fin");
    
}


@end
