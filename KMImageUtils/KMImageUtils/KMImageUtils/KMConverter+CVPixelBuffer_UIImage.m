////  KMConverter+CVPixelBuffer_UIImage.m
//  KMImageUtils
//
//  Created by Su Jinjin on 2020/5/9.
//  Copyright © 2020 苏金劲. All rights reserved.
//

#import "KMConverter+CVPixelBuffer_UIImage.h"
#import "KMConverter+CVPixelBuffer_CGImageRef.h"

@implementation KMConverter (CVPixelBuffer_UIImage)

+ (CVPixelBufferRef)KM_UIImage_To_CVPixelBuffer: (UIImage *)image {
    
    CGImageRef cgImage = image.CGImage;
    CVPixelBufferRef buf = [KMConverter KM_CGImage_To_CVPixelBuffer: cgImage];
    CGImageRelease(cgImage);
    return buf;
}

+ (UIImage *)KM_CVPixelBuffer_To_UIImage: (CVPixelBufferRef)pixelBuffer {
    
    CGImageRef cgImage = [KMConverter KM_CVPixelBuffer_To_CGImage: pixelBuffer];
    UIImage *uiImage = [UIImage imageWithCGImage: cgImage];
    CGImageRelease(cgImage);
    return uiImage;
}

+ (UIImage *)KM_CVPixelBuffer_To_UIImage2: (CVPixelBufferRef)pixelBuffer {
    
    CGImageRef cgImage = [KMConverter KM_CVPixelBuffer_To_CGImage2: pixelBuffer];
    UIImage *uiImage = [UIImage imageWithCGImage: cgImage];
    CGImageRelease(cgImage);
    return uiImage;
}

@end
