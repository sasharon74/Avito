//
//  ParserMediaItem.h
//  AvitoTest
//
//  Created by Alex on 17.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParserMediaItem : NSObject

+ (NSArray *)parsingJSON:(NSDictionary *)response;

@end
