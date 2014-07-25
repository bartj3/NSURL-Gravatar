//
//  NSURL+Gravatar.h
//  shome
//
//  Created by Bart van Zon on 26/02/14.
//  Copyright (c) 2014 Bart van Zon. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  @brief Default image type for gravatar, a fallback in case the email was not found
 */
typedef NS_ENUM(NSUInteger, kGravatarDefaultImageType) {
    
    /**
     *  @brief  Do not load any image if none is associated with the email hash,
     *          instead return an HTTP 404 (File Not Found) response
     */
    kGravatarDefaultImageType404,
    
    /**
     *  @brief  (mystery-man) a simple, cartoon-style silhouetted outline of
     *          a person (does not vary by email hash)
     */
    kGravatarDefaultImageTypeMysteryMan,
    
    /**
     *  @brief a geometric pattern based on an email hash
     */
    kGravatarDefaultImageTypeIdenticon,
    
    /**
     *  @brief a generated 'monster' with different colors, faces, etc
     */
    kGravatarDefaultImageTypeMonsterId,
    
    /**
     *  @brief generated faces with differing features and backgrounds
     */
    kGravatarDefaultImageTypeWavatar,
    
    /**
     *  @brief awesome generated, 8-bit arcade-style pixelated faces
     */
    kGravatarDefaultImageTypeRetro,
    
    /**
     *  @brief a transparent PNG image
     */
    kGravatarDefaultImageTypeBlank,
};

@interface NSURL (Gravatar)

/**
 *  @brief Builds a new URL for the desired gravatar
 *
 *  @param email the email address for gravatar
 *  @param size  the desired size
 *
 *  @return built URL of the gravatar
 */
+ (NSURL *)URLWithGravatarEmail:(NSString *)email size:(NSUInteger)size;

/**
 *  @brief Builds a new URL for the desired gravatar setting its default image type
 *
 *  @param email the email address for gravatar
 *  @param size  the desired size
 *  @param defaultImageType  desired default image type (kGravatarDefaultImageType)
 *
 *  @return built URL of the gravatar with desired size and default image
 */
+  (NSURL *)URLWithGravatarEmail:(NSString *)email size:(NSUInteger)size defaultImageType:(kGravatarDefaultImageType)defaultImageType;

@end
