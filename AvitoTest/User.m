//
//  User.m
//  AvitoTest
//
//  Created by Alex on 15.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "User.h"

@implementation User

+ (NSDictionary *)mapping{
    return @{
                @"avatar_url":  @"avatar_url",
                @"login":       @"login",
                @"url":         @"url"
             };
}

@end
