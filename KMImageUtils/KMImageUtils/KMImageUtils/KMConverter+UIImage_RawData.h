////  KMConverter+UIImage_RawData.h
//  KMImageUtils
//
//  Created by Su Jinjin on 2020/5/11.
//  Copyright © 2020 苏金劲. All rights reserved.
//

#import "KMConverter.h"

NS_ASSUME_NONNULL_BEGIN

@interface KMConverter (UIImage_RawData)

/// Convert from Raw Data to UIImage
/// @param rawData Raw Data bytes
/// @param width Width of image
/// @param height Height of image
+ (UIImage *)KM_RawData_To_UIImage: (void *)rawData
                             width: (size_t)width
                            height: (size_t)height;

/// Convert from UIImage to Raw Data
/// @param image Image to be converted
+ (void *)KM_UIImage_To_RawData: (UIImage *)image;

@end

NS_ASSUME_NONNULL_END
