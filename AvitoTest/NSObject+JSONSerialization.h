//
//  NSObject+JSONSerialization.h
//  AvitoTest
//
//  Created by Alex on 15.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JSONSerialization)

+ (NSDictionary *)mapping;
+ (instancetype)withDictionary:(NSDictionary *)dictionary;
+ (NSArray *)withArray:(NSArray *)array;

@end
