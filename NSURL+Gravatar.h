//
//  NSURL+Gravatar.h
//  shome
//
//  Created by Bart van Zon on 26/02/14.
//  Copyright (c) 2014 Bart van Zon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (Gravatar)

+(NSURL *)URLWithGravatarEmail:(NSString *)email size:(int)size;

@end
