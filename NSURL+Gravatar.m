//
//  NSURL+Gravatar.m
//  shome
//
//  Created by Bart van Zon on 26/02/14.
//  Copyright (c) 2014 Bart van Zon. All rights reserved.
//

#import "NSURL+Gravatar.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSURL (Gravatar)

NSString * const kGravatar404DefaultImageStringValue        = @"404";
NSString * const kGravatarMysteryManDefaultImageStringValue = @"mysteryman";
NSString * const kGravatarIdenticonDefaultImageStringValue  = @"identicon";
NSString * const kGravatarMonsterIdDefaultImageStringValue  = @"monsterid";
NSString * const kGravatarWavatarDefaultImageStringValue    = @"wavatar";
NSString * const kGravatarRetroDefaultImageStringValue      = @"retro";
NSString * const kGravatarBlankDefaultImageStringValue      = @"blank";

#pragma mark - Public

+ (NSURL *)URLWithGravatarEmail:(NSString *)email size:(NSUInteger)size {
    
    return [[self class] URLWithGravatarEmail:email
                                         size:size
                             defaultImageType:kGravatarDefaultImageType404];
}

+ (NSURL *)URLWithGravatarEmail:(NSString *)email size:(NSUInteger)size defaultImageType:(kGravatarDefaultImageType)defaultImageType {
    
    NSString *hashedEmail = [self MD5: [email lowercaseString]];
    NSString *gravatarURLString = [NSString stringWithFormat:@"http://www.gravatar.com/avatar/%@?d=%@&size=%d",
                                   hashedEmail,
                                   NSStringFromGravatarImageType(defaultImageType),
                                   size];
    return [NSURL URLWithString:gravatarURLString];
}

#pragma mark - Private 

/**
 *  @brief  Direct convertion from image type to its Gravatar internal
 representation of default image types
 *
 *  @param type the type of Default image
 *
 *  @return a string representing with the internal format required for
 *          building the URL with a valid default image type
 */
static NSString * NSStringFromGravatarImageType(kGravatarDefaultImageType type) {
    
    switch (type) {
            
        case kGravatarDefaultImageType404:
            
            return kGravatar404DefaultImageStringValue;
            
        case kGravatarDefaultImageTypeMysteryMan:
            
            return kGravatarMysteryManDefaultImageStringValue;
            
        case kGravatarDefaultImageTypeIdenticon:
            
            return kGravatarIdenticonDefaultImageStringValue;
            
        case kGravatarDefaultImageTypeMonsterId:
            
            return kGravatarMonsterIdDefaultImageStringValue;
            
        case kGravatarDefaultImageTypeWavatar:
            
            return kGravatarWavatarDefaultImageStringValue;
            
        case kGravatarDefaultImageTypeRetro:
            
            return kGravatarRetroDefaultImageStringValue;
            
        case kGravatarDefaultImageTypeBlank:
            
            return kGravatarBlankDefaultImageStringValue;
            
        default:
            
            return kGravatarDefaultImageType404;
    }
}

/**
 *  @brief MD5 Helper generator
 *
 *  @param string the string to transform
 *
 *  @return an MD5 representation of the provided string
 */
+ (NSString*)MD5:(NSString *)string {
    
    const char *pointer = [string UTF8String];
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(pointer, strlen(pointer), md5Buffer);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x",md5Buffer[i]];
    }
    
    return output;
}

@end
