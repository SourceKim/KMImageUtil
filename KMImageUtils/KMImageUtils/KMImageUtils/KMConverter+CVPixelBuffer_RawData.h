////  KMConverter+CVPixelBuffer_RawData.h
//  KMImageUtils
//
//  Created by Su Jinjin on 2020/5/9.
//  Copyright © 2020 苏金劲. All rights reserved.
//

#import "KMConverter.h"

NS_ASSUME_NONNULL_BEGIN

@interface KMConverter (CVPixelBuffer_RawData)

/// Convert RawData to CVPixelBuffer
/// @param rawData RawData by bytes
/// @param width Width Of Image
/// @param height Height Of Image
+ (CVPixelBufferRef)KM_RawData_To_CVPixelBuffer: (void *)rawData
                                          width: (size_t)width
                                         height: (size_t)height;

/// Convert from CGImageRef to Raw Data
/// @param pixelBuffer Buffer to be converted
+ (void *)KM_CVPixelBuffer_To_RawData: (CVPixelBufferRef)pixelBuffer;

@end

NS_ASSUME_NONNULL_END
