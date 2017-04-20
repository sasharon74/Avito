//
//  UsersResponse.m
//  AvitoTest
//
//  Created by Alex on 14.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "UsersResponse.h"
#import "User.h"
#import "ParserUser.h"

@implementation UsersResponse

- (id)processResponseObject:(NSError **)error{
    NSError *__error;
    id processedResponseObject = [super processResponseObject:&__error];
    if (__error || ![processedResponseObject isKindOfClass:[NSDictionary class]]) {
        if (error) *error = __error;
        return nil;
    }else{
        //парсинг
        return [User withArray:[ParserUser parsingJSON:processedResponseObject]];
        //return [User withArray:processedResponseObject];
    }
}


- (NSArray *)users{
    return self.processedResponseObject;
}

@end
