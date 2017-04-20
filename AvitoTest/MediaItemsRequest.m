//
//  MediaItemsRequest.m
//  AvitoTest
//
//  Created by Alex on 14.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "MediaItemsRequest.h"
#import "MediaItemsResponse.h"

@implementation MediaItemsRequest

- (NSString *)path{
    return @"search";
}

//- (NSDictionary *)parameters{
//    return @{
//             @"term":  @"asap"
//             };
//}

- (Class)responseClass{
    return [MediaItemsResponse class];
}

- (void)setSearchStringAttribute:(NSString *)searchStr{
    
    [self setParameters:@{
                            @"term":  searchStr
                        }];
}


@end
