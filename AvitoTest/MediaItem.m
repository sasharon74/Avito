//
//  MediaItem.m
//  AvitoTest
//
//  Created by Alex on 15.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "MediaItem.h"

@implementation MediaItem

+ (NSDictionary *)mapping{
    return @{
                @"artistName":  @"artistName",
                @"trackName":   @"trackName",
                @"artworkUrl100":         @"artworkUrl100"
             };
}

@end
