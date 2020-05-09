////  KMConverter+CGImageRef_RawData.m
//  KMImageUtils
//
//  Created by Su Jinjin on 2020/5/9.
//  Copyright © 2020 苏金劲. All rights reserved.
//

#import "KMConverter+CGImageRef_RawData.h"

@implementation KMConverter (CGImageRef_RawData)

+ (CGImageRef)KM_RawData_To_CGImageRef: (void *)rawData
                                 width: (size_t)width
                                height: (size_t)height {
    CGColorSpaceRef colorSpace;
    CGContextRef cgContext;
    colorSpace = CGColorSpaceCreateDeviceRGB();
    cgContext = CGBitmapContextCreate(rawData, width, height, 8, width * 4, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
    CGColorSpaceRelease(colorSpace);
    //透过 CGImageRef 将 CGContextRef 转换成 UIImage
    CGImageRef cgImage;
    cgImage = CGBitmapContextCreateImage(cgContext);
    CGImageRelease(cgImage);
    CGContextRelease(cgContext);
    return cgImage;
}

+ (void *)KM_CGImageRef_To_RawData: (CGImageRef)cgImage {
    
    CGDataProviderRef provider = CGImageGetDataProvider(cgImage);
    CFDataRef cfData = CGDataProviderCopyData(provider); // CFData leaking
    void *rawData = (void *)CFDataGetBytePtr(cfData);
    
    return rawData;
}

@end
