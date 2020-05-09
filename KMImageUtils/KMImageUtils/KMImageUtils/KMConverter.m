////  KMConverter.m
//  KMImageUtils
//
//  Created by Su Jinjin on 2020/5/9.
//  Copyright © 2020 苏金劲. All rights reserved.
//

#import "KMConverter.h"

@implementation KMConverter

+ (uint32_t)bitmapInfo:(OSType)pixelFormat {
    
    if (pixelFormat == kCVPixelFormatType_32BGRA) {
        return kCGImageAlphaNoneSkipFirst | kCGBitmapByteOrder32Host;
    }
    
    return 0;
}

@end
