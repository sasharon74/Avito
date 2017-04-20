//
//  ParserMediaItem.m
//  AvitoTest
//
//  Created by Alex on 17.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "ParserMediaItem.h"
#import "NSObject+JSONSerialization.h"

@implementation ParserMediaItem

+ (NSArray *)parsingJSON:(NSDictionary *)response{
    
    if (!response){
        return @[];
    }
    
    if (!response[@"results"]){
        return @[];
    }
    
    NSArray *items = response[@"results"];
    return items;
}

@end
