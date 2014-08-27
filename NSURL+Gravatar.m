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

+(NSURL *)URLWithGravatarEmail:(NSString *)email size:(int)size
{
    NSString *hashedEmail = [self MD5:[email lowercaseString]];
    NSString *gravatarURLString = [NSString stringWithFormat:@"http://www.gravatar.com/avatar/%@?d=404&size=%d", hashedEmail, size];
    return [NSURL URLWithString:gravatarURLString];
}

+ (NSString *)MD5:(NSString *)string
{
    const char *pointer = [string UTF8String];
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(pointer, (CC_LONG)[string lengthOfBytesUsingEncoding:NSUTF8StringEncoding], md5Buffer);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", md5Buffer[i]];
    }
    
    return [output copy];
}
@end
