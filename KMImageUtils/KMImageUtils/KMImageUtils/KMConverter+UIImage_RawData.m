////  KMConverter+UIImage_RawData.m
//  KMImageUtils
//
//  Created by Su Jinjin on 2020/5/11.
//  Copyright © 2020 苏金劲. All rights reserved.
//

#import "KMConverter+UIImage_RawData.h"

#import "KMConverter+CGImageRef_RawData.h"

@implementation KMConverter (UIImage_RawData)

+ (UIImage *)KM_RawData_To_UIImage: (void *)rawData
                             width: (size_t)width
                            height: (size_t)height {
    
    CGImageRef cgImage = [KMConverter KM_RawData_To_CGImageRef: rawData
                                                         width: width
                                                        height: height];
    
    return [UIImage imageWithCGImage: cgImage];
}

+ (void *)KM_UIImage_To_RawData: (UIImage *)image {
    
    CGImageRef cgImage = image.CGImage;
    
    return [KMConverter KM_CGImageRef_To_RawData: cgImage];
}

@end
