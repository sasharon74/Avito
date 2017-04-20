//
//  ITunesJSONRequest.m
//  AvitoTest
//
//  Created by Alex on 14.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "ITunesJSONRequest.h"

@implementation ITunesJSONRequest

- (NSURL *)baseURL{
    return [NSURL URLWithString:@"https://itunes.apple.com/"];
}

@end
