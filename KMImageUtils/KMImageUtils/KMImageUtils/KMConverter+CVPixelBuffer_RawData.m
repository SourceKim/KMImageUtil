////  KMConverter+CVPixelBuffer_RawData.m
//  KMImageUtils
//
//  Created by Su Jinjin on 2020/5/9.
//  Copyright © 2020 苏金劲. All rights reserved.
//

#import "KMConverter+CVPixelBuffer_RawData.h"

@implementation KMConverter (CVPixelBuffer_RawData)

+ (CVPixelBufferRef)KM_RawData_To_CVPixelBuffer: (void *)rawData
                                          width: (size_t)width
                                         height: (size_t)height {
    CVPixelBufferRef pxbuffer = NULL;
    
    CFDictionaryRef empty;
    empty = CFDictionaryCreate(kCFAllocatorDefault, NULL, NULL,
                               0,
                               &kCFTypeDictionaryKeyCallBacks,
                               &kCFTypeDictionaryValueCallBacks);
    
    CFMutableDictionaryRef m_pPixelBufferAttribs = CFDictionaryCreateMutable(kCFAllocatorDefault,
                                                      3,
                                                      &kCFTypeDictionaryKeyCallBacks,
                                                      &kCFTypeDictionaryValueCallBacks);
    
    CFDictionarySetValue(m_pPixelBufferAttribs, kCVPixelBufferIOSurfacePropertiesKey, empty);
    CFDictionarySetValue(m_pPixelBufferAttribs, kCVPixelBufferOpenGLCompatibilityKey, empty);
    CFDictionarySetValue(m_pPixelBufferAttribs, kCVPixelBufferCGBitmapContextCompatibilityKey, empty);
    
    CVPixelBufferCreateWithBytes(kCFAllocatorDefault,
                                 width,
                                 height,
                                 kCVPixelFormatType_32BGRA,
                                 rawData,
                                 width * 4,
                                 NULL,
                                 NULL,
                                 m_pPixelBufferAttribs,
                                 &pxbuffer);
    CFRelease(empty);
    CFRelease(m_pPixelBufferAttribs);
    
    return pxbuffer;
}

+ (void *)KM_CVPixelBuffer_To_RawData: (CVPixelBufferRef)pixelBuffer {
    
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    void *rawData = CVPixelBufferGetBaseAddress(pixelBuffer);
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    
    return rawData;
}

@end
