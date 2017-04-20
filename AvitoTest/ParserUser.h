//
//  ParserUser.h
//  AvitoTest
//
//  Created by Alex on 16.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParserUser : NSObject

+ (NSArray *)parsingJSON:(NSDictionary *)response;

@end
