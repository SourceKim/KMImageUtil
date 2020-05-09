////  KMConverter+CVPixelBuffer_CGImageRef.m
//  KMImageUtils
//
//  Created by Su Jinjin on 2020/5/9.
//  Copyright © 2020 苏金劲. All rights reserved.
//

#import "KMConverter+CVPixelBuffer_CGImageRef.h"

#import "KMConverter+CVPixelBuffer_RawData.h"

@implementation KMConverter (CVPixelBuffer_CGImageRef)

+ (CVPixelBufferRef)KM_CGImage_To_CVPixelBuffer: (CGImageRef)image {
    
    NSCParameterAssert(NULL != image);
    size_t originalWidth = CGImageGetWidth(image);
    size_t originalHeight = CGImageGetHeight(image);
    
    NSMutableData *imageData = [NSMutableData dataWithLength:originalWidth*originalHeight*4];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef cgContext = CGBitmapContextCreate([imageData mutableBytes],
                                                   originalWidth,
                                                   originalHeight,
                                                   8,
                                                   4*originalWidth,
                                                   colorSpace,
                                                   [KMConverter bitmapInfo: kCVPixelFormatType_32BGRA]
                                                   );
    CGColorSpaceRelease(colorSpace);
    CGContextDrawImage(cgContext, CGRectMake(0, 0, originalWidth, originalHeight), image);
    CGContextRelease(cgContext);
    CGImageRelease(image);
    void *pImageData = (void *)[imageData bytes];
    
    CVPixelBufferRef pxbuffer = [KMConverter KM_RawData_To_CVPixelBuffer: pImageData
                                                                   width: originalWidth
                                                                  height: originalHeight];
    
    return pxbuffer;
}

+ (CGImageRef)KM_CVPixelBuffer_To_CGImage: (CVPixelBufferRef)pixelBuffer {
    
    CIImage * ciImage = [CIImage imageWithCVPixelBuffer: pixelBuffer ];
    
    CIContext * ctx = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [ctx createCGImage: ciImage fromRect: CGRectMake(0, 0, CVPixelBufferGetWidth(pixelBuffer), CVPixelBufferGetHeight(pixelBuffer))];
    
    return cgImage;
}

+ (CGImageRef)KM_CVPixelBuffer_To_CGImage2: (CVPixelBufferRef)pixelBuffer {
    
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    //从 CVImageBufferRef 取得影像的细部信息
    uint8_t *base;
    size_t width, height, bytesPerRow;
    base = CVPixelBufferGetBaseAddress(pixelBuffer);
    width = CVPixelBufferGetWidth(pixelBuffer);
    height = CVPixelBufferGetHeight(pixelBuffer);
    bytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
    //利用取得影像细部信息格式化 CGContextRef
    CGColorSpaceRef colorSpace;
    CGContextRef cgContext;
    colorSpace = CGColorSpaceCreateDeviceRGB();
    cgContext = CGBitmapContextCreate(base, width, height, 8, bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
    CGColorSpaceRelease(colorSpace);
    //透过 CGImageRef 将 CGContextRef 转换成 UIImage
    CGImageRef cgImage;
    cgImage = CGBitmapContextCreateImage(cgContext);
    CGImageRelease(cgImage);
    CGContextRelease(cgContext);
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    return cgImage;
}

@end
