////  KMConverter+CVPixelBuffer_UIImage.h
//  KMImageUtils
//
//  Created by Su Jinjin on 2020/5/9.
//  Copyright © 2020 苏金劲. All rights reserved.
//

#import "KMConverter.h"

NS_ASSUME_NONNULL_BEGIN

@interface KMConverter (CVPixelBuffer_UIImage)

+ (CVPixelBufferRef)KM_UIImage_To_CVPixelBuffer: (UIImage *)image;

/// Convert from  CVPixelBuffer to UIImage (Core Image)
/// @param pixelBuffer Buffer to be converted
+ (UIImage *)KM_CVPixelBuffer_To_UIImage: (CVPixelBufferRef)pixelBuffer;

/// Convert from  CVPixelBuffer to UIImage (Core Graphis)
/// @param pixelBuffer Buffer to be converted
+ (UIImage *)KM_CVPixelBuffer_To_UIImage2: (CVPixelBufferRef)pixelBuffer;

@end

NS_ASSUME_NONNULL_END
