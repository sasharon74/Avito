//
//  MediaItemsResponse.m
//  AvitoTest
//
//  Created by Alex on 14.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "MediaItemsResponse.h"
#import "MediaItem.h"
#import "ParserMediaItem.h"

@implementation MediaItemsResponse

- (id)processResponseObject:(NSError **)error{
    NSError *__error;
    id processedResponseObject = [super processResponseObject:&__error];
    if (__error || ![processedResponseObject isKindOfClass:[NSDictionary class]]) {
        if (error) *error = __error;
        return nil;
    }else{
        //парсинг
        return [MediaItem withArray:[ParserMediaItem parsingJSON:processedResponseObject]];
        //return [User withArray:processedResponseObject];
    }
}


- (NSArray *)items{
    return self.processedResponseObject;
}


@end
