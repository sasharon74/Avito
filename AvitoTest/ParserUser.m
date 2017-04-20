//
//  ParserUser.m
//  AvitoTest
//
//  Created by Alex on 16.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "ParserUser.h"
#import "NSObject+JSONSerialization.h"

@implementation ParserUser

+ (NSArray *)parsingJSON:(NSDictionary *)response{
    
    if (!response){
        return @[];
    }
    
    if (!response[@"items"]){
        return @[];
    }
    
    NSArray *items = response[@"items"];
    return items;
    //return [self withArray:items];
}

@end
