////  KMConverter+CGImageRef_RawData.h
//  KMImageUtils
//
//  Created by Su Jinjin on 2020/5/9.
//  Copyright © 2020 苏金劲. All rights reserved.
//

#import "KMConverter.h"

NS_ASSUME_NONNULL_BEGIN

@interface KMConverter (CGImageRef_RawData)

/// Convert from Raw Data to CGImageRef
/// @param rawData Raw Data bytes
/// @param width Width of image
/// @param height Height of image
+ (CGImageRef)KM_RawData_To_CGImageRef: (void *)rawData
                                 width: (size_t)width
                                height: (size_t)height;

/// Convert from CGImageRef to Raw Data
/// @param cgImage Image to be converted
+ (void *)KM_CGImageRef_To_RawData: (CGImageRef)cgImage;

@end

NS_ASSUME_NONNULL_END
