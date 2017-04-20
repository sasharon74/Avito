//
//  GitHubJSONRequest.m
//  AvitoTest
//
//  Created by Alex on 14.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "GitHubJSONRequest.h"

@implementation GitHubJSONRequest

- (NSURL *)baseURL{
    return [NSURL URLWithString:@"https://api.github.com/"];
}

@end
