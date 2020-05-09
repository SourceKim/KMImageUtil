////  KMConverter+CVPixelBuffer_CGImageRef.h
//  KMImageUtils
//
//  Created by Su Jinjin on 2020/5/9.
//  Copyright © 2020 苏金劲. All rights reserved.
//

#import "KMConverter.h"

NS_ASSUME_NONNULL_BEGIN

@interface KMConverter (CVPixelBuffer_CGImageRef)

/// Convert from CGImageRef to CVPixelBuffer ( Implement by RawData )
/// @param image Image to be converted
+ (CVPixelBufferRef)KM_CGImage_To_CVPixelBuffer: (CGImageRef)image;

/// Convert from  CVPixelBuffer to CGImageRef (Core Image)
/// @param pixelBuffer Buffer to be converted
+ (CGImageRef)KM_CVPixelBuffer_To_CGImage: (CVPixelBufferRef)pixelBuffer;

/// Convert from  CVPixelBuffer to CGImageRef (Core Graphis)
/// @param pixelBuffer Buffer to be converted
+ (CGImageRef)KM_CVPixelBuffer_To_CGImage2: (CVPixelBufferRef)pixelBuffer;

@end

NS_ASSUME_NONNULL_END
