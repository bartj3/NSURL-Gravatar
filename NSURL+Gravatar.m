//
//  NSURL+Gravatar.m
//  shome
//
//  Created by Bart van Zon on 26/02/14.
//  Copyright (c) 2014 Bart van Zon. All rights reserved.
//

@import CommonCrypto;

#import "NSURL+Gravatar.h"



@implementation NSURL (Gravatar)

+(NSURL *)URLWithGravatarEmail:(NSString *)email size:(int)size
{
    NSString *hashedEmail = [self MD5:[email lowercaseString]];
    NSString *gravatarURLString = [NSString stringWithFormat:@"http://www.gravatar.com/avatar/%@?d=404&size=%d", hashedEmail, size];
    return [NSURL URLWithString:gravatarURLString];
}

+ (NSString *)MD5:(NSString *)string
{
    const char *stringPointer = [string UTF8String];
    CC_LONG stringLength = (CC_LONG)[string lengthOfBytesUsingEncoding:NSUTF8StringEncoding];

    unsigned char MD5ByteBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(stringPointer, stringLength, MD5ByteBuffer);
    NSMutableString *MD5StringOutput = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [MD5StringOutput appendFormat:@"%02x", MD5ByteBuffer[i]];
    }
    
    return [MD5StringOutput copy];
}

@end
