//
//  UsersRequest.m
//  AvitoTest
//
//  Created by Alex on 14.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "UsersRequest.h"
#import "UsersResponse.h"

@implementation UsersRequest

- (NSString *)path{
    return @"search/users";
}

//- (NSDictionary *)parameters{
//    return @{
//                @"q":  @"asap"
//             };
//}

- (Class)responseClass{
    return [UsersResponse class];
}

- (void)setSearchStringAttribute:(NSString *)searchStr{
    
    [self setParameters:@{
                            @"q":  searchStr
                          }];
}


@end
