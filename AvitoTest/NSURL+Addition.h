//
//  NSURL+Addition.h
//  AvitoTest
//
//  Created by Alex on 15.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (Addition)

+ (NSURL *)urlWithString:(NSString *)path
                 baseURL:(NSURL *)baseURL
              parameters:(NSDictionary *)parameters;

@end
